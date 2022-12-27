require '../aoc'

def can_visit(node, visited)
  if node.upcase == node 
    return true
  end
  if node == 'start' or node == 'end'
    return visited[node] < 1
  end
  if visited.select {|k,v| k == k.downcase }.values.all? {_1 < 2}
    return true
  end
  visited[node] == 0
end

def find_paths(g, visited, current, target)
  if current == target
    return 1
  end
  next_nodes = g[current].select { can_visit(_1, visited) }.freeze
  next_nodes.map {|n|
    visited_new= visited.dup
    visited_new[n] += 1
    find_paths(g, visited_new, n, target)
  }.sum
end

g = Hash.new
input = lines.map { _1.split '-' }
input.each { |k,v| g[k] = []; g[v] = [] }
input.each { |k,v| g[k].append(v); g[v].append(k) }
visited = Hash.new(0)
visited['start'] = 1
p find_paths(g, visited, 'start', 'end')
