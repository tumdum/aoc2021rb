require '../aoc'

def score_(p1,p2)
  n = (p1-p2).abs
  (n*(n+1))/2
end
def score(n,point)
  n.map { score_(_1, point) }.sum
end

n = ARGF.readline.ints
p (n.min..n.max).map { score(n,_1) }.min
