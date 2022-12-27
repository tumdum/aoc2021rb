require '../aoc'

def show(b)
  minr = b.map(&:row).min
  maxr = b.map(&:row).max
  minc = b.map(&:col).min
  maxc = b.map(&:col).max
  (minr..maxr).each {|r|
    (minc..maxc).each {|c|
      p = P2.new(r,c)
      if b.include? p
        print '#'
      else
        print '.'
      end
    }
    puts
  }
end

def fold_y(b, y)
  b.map {|p|
    if p.row > y
      d = p.row - y
      P2.new(y-d,p.col)
    else
      p
    end
  }.to_set
end

def fold_x(b, x)
  b.map {|p|
    if p.col > x
      d = p.col - x
      P2.new(p.row, x-d)
    else
      p
    end
  }.to_set
end

points, folds = lines.split_by { _1.empty? }
points = points.map { 
  col, row = _1.ints 
  P2.new(row, col)
}.to_set
folds = folds.map { 
  axis, val = _1.split(' ')[-1].split('=')
  [axis, val.to_i]
}
first = true
folds.each {|axis, value|
  if axis == 'y'
    points = fold_y(points, value)
  else
    points = fold_x(points, value)
  end
  if first
    first = false
    p points.length
  end
}
