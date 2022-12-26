require '../aoc'

g = grid{ _1.to_i }
risk_levels = g.length.times.map {|row|
  g[row].length.times.map {|col|
    p = P2.new(row,col)
    h = g[row][col]
    if p.adjacent(g).all? {|p,v| v > h}
      1+h
    end
  }
}.flatten.compact
p risk_levels.sum
