require '../aoc'

def step(g)
  flashed = Set.new
  todo = Set.new
  g.length.times {|r|
    g[r].length.times {|c|
      g[r][c] += 1
      if g[r][c] > 9
        todo.add(P2.new(r,c))
      end
    }
  }
  while todo.length > 0
    p = todo.first
    todo.delete p
    g[p.row][p.col] = 0
    flashed.add(p)
    p.adjacent(g, true).reject { flashed.include? _1 or todo.include? _1 }.each {|adj,value|
      g[adj.row][adj.col] += 1
      if g[adj.row][adj.col] > 9
        todo.add(adj)
      end
    }
  end
  [g, flashed.length]
end

g = grid(&:to_i)
total = 0
100.times {
  gnew, flashed = step g
  g = gnew
  total += flashed
}
p total
