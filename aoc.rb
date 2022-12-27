def lines
  ARGF.readlines.map(&:strip)
end

def id(a)
  a
end

def grid(&parse)
  parse = Proc.new{|c| c} if parse.nil?
  lines.map { _1.chars.map { |c| parse.call(c) } }
end

class String
  def ints
    self.scan(/\d+/).map(&:to_i)
  end
end

class Array
  def split_by(&pred)
    self.chunk(&pred).select { !_1[0] }.map { _1[1] }.to_a
  end
end

class P2
  attr_accessor :row, :col
  def y
    self.row
  end
  def x
    self.col
  end
  def initialize(row, col)
    self.row = row
    self.col = col
  end

  def -(o)
    row = self.row - o.row
    col = self.col - o.col
    P2.new(row, col)
  end

  def +(o)
    row = self.row + o.row
    col = self.col + o.col
    P2.new(row, col)
  end

  def <=>(o)
    [self.row, self.col] <=> [o.row, o.col]
  end

  def ==(o)
    [self.row, self.col] == [o.row, o.col]
  end
  def eql?(o)
    [self.row, self.col] == [o.row, o.col]
  end
  def hash
    [self.row, self.col].hash
  end

  def signum
    P2.new(self.row <=> 0, self.col <=> 0)
  end

  def adjacent(map, diag = false)
    l = if diag
          ADJACENT.concat DIAG
        else
          ADJACENT
        end
    l.map {|p|
      p = self + p
      if p.row < 0 || p.col < 0
        nil
      elsif p.row >= map.length || p.col >= map[p.row].length
        nil
      else
        [p, map[p.row][p.col]]
      end
    }.compact.to_h
  end
end


ADJACENT = [
  P2.new(0,1),
  P2.new(0,-1),
  P2.new(1,0),
  P2.new(-1,0),
]
DIAG = [
  P2.new(1,1),
  P2.new(-1,-1),
  P2.new(-1,1),
  P2.new(1,-1),
]

class Queue2
  attr_reader :data

  def initialize(*args)
    @data = [*args]
  end

  def push(item)
    @data.unshift(item)
  end

  def pop
    @data.pop
  end

  def size
    @data.length
  end

  def empty?
    self.length == 0
  end
end
