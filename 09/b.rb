require '../aoc'

def grow_from(start,g)
  seen = Set.new([start])
  todo = Queue.new([start])
  while !todo.empty?
    adjacent = todo.pop.adjacent(g).reject { seen.include? _1 or _2 == 9 }
    adjacent.each { |p,h| seen.add(p); todo.push(p) }
  end
  seen.length
end

g = grid(&:to_i)
starts = g.length.times.map {|row|
  g[row].length.times.map {|col|
    p = P2.new(row,col)
    p if p.adjacent(g).all? {|p,v| v > g[row][col]}
  }
}.flatten.compact
p starts.map { grow_from(_1, g) }.sort[-3..].reduce(:*)
