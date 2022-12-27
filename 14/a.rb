require '../aoc'

def step(start, rules)
  current = ""
  start.chars.each_cons(2).each {|a,b|
    current += a
    to_insert = rules[a+b]
    if !to_insert.nil?
      current += to_insert
    end
  }
  current += start.chars.last
  current
end

template, *rules = lines.reject &:empty?
rules = rules.map { _1.split " -> " }.to_h
p template, rules
current = template
10.times {
  current = step(current, rules)
}
p current.length
tally = p current.chars.tally
p tally.max_by { |k,v| v }[1] - tally.min_by { |k,v| v }[1]
