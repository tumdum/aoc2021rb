require '../aoc'

def score(n,point)
  n.map { (_1 - point).abs }.sum
end

n = ARGF.readline.ints
p (n.min..n.max).map { score(n,_1) }.min
