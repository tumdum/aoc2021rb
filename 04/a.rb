input = ARGF.readlines.map(&:strip).chunk { _1.empty? }.select { !_1[0] }
bingo = input[0][1][0].split(',').map(&:to_i)
cards = input[1..].map { _1[1] }.map { |card| card.map { _1.split(' ').map(&:to_i) } }

def wins(b)
  return true if b.any? {|row| row.all? { _1 == nil } }
  (0..4).any? {|col| b.all? {|row| row[col] == nil } }
end

bingo.each {|n|
  cards.each {|c|
    c.each {|r|
      (0..4).each {|i| r[i] = nil if r[i] == n }
    }
  }
  if win = cards.detect { wins(_1) }
    p win.flatten.compact.sum * n
    break
  end
}
