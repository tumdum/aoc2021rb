require '../aoc'

def dfs(g, visited, current, target)
  if current == target
    return 1
  end
  next_nodes = g[current].reject { visited.include? _1 and _1.downcase == _1 }
  visited = visited.dup
  visited.add(current)
  next_nodes.map { dfs(g, visited, _1, target) }.sum
end

g = Hash.new
input = lines.map { _1.split '-' }
input.each { |k,v| g[k] = []; g[v] = [] }
input.each { |k,v| g[k].append(v); g[v].append(k) }
visited = Set.new(['start'])
p dfs(g, visited, 'start', 'end')
