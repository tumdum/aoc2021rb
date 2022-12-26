require '../aoc'

l = lines.map { 
  a,b,c,d = _1.ints 
  [P2.new(a,b), P2.new(c,d)]
}

points = l.map {|a,b|
  d = (b - a).signum
  start = a
  ret = []
  loop do
    ret.append(start)
    break if start == b
    start = start + d
  end
  ret
}
pp points.flatten.tally.select { _2 > 1 }.length

