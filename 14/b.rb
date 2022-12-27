require '../aoc'

def step(start, rules)
  ret = Hash.new(0)
  start.each {|k,v|
    ret[k[0] + rules[k]] += v
    ret[rules[k] + k[1]] += v
  }
  ret
end

def count(state, template)
  ret = Hash.new(0)
  state.each {|k,v|
    ret[k[0]] += v
    ret[k[1]] += v
  }
  ret[template.chars.first] += 1
  ret[template.chars.last] += 1
  ret
end

template, *rules = lines.reject &:empty?
rules = rules.map { _1.split " -> " }.to_h
current = Hash.new(0)
template.chars.each_cons(2).each {|a,b| current[a+b] += 1}
40.times { current = step(current, rules) }
counts = count(current, template)
p (counts.map{|k,v| v}.max - counts.map{|k,v| v}.min)/2
