require '../aoc'

l = lines.map { 
  a,b,c,d = _1.ints 
  [P2.new(a,b), P2.new(c,d)]
}.select { _1[0].x == _1[1].x or _1[0].y == _1[1].y }

points = l.map {|pair|
  if pair[0].row == pair[1].row
    r = [pair[0].col, pair[1].col]
    r.sort!
    (r[0]..r[1]).map {|col|
      P2.new(pair[0].row, col)
    }
  else 
    r = [pair[0].row, pair[1].row]
    r.sort!
    (r[0]..r[1]).map {|row|
      P2.new(row, pair[0].col)
    }
  end
}
pp points.flatten.tally.select { _2 > 1 }.length
