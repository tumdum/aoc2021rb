require '../aoc'

CLOSING = {
  '{' => '}',
  '(' => ')',
  '[' => ']',
  '<' => '>',
}

KEYS = CLOSING.keys.to_set

SCORE = {
  ')' => 1,
  ']' => 2,
  '}' => 3,
  '>' => 4,
}

def score(l)
  ret = 0
  l.each {|n|
    ret = ret * 5 + SCORE[n]
  }
  ret
end

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
    s.reverse!
    return s
  end
end

scores = lines.map { check(_1) }.select { _1.is_a? Array }.map { score _1 }.sort
p scores[scores.length / 2]

