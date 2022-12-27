require '../aoc'

CLOSING = {
  '{' => '}',
  '(' => ')',
  '[' => ']',
  '<' => '>',
}

KEYS = CLOSING.keys.to_set

SCORE = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25137,
}

def check(l)
  s = []
  l.chars.each {|c|
    if KEYS.include? c
      s.push(CLOSING[c])
    else
      expect = s.pop
      if expect == c
      else
        return SCORE[c]
      end
    end
  }
  if s.empty?
    return 'ok'
  else
    return 'incomplete'
  end
end

pp lines.map  { check(_1) }.select { _1.is_a? Integer }.sum
