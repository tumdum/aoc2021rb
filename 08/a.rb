known = {
  0 => "ABCEFG",
  1 => "CF",
  2 => "ACDEG",
  3 => "ACDFG",
  4 => "BCDF",
  5 => "ABDFG",
  6 => "ABDEFG",
  7 => "ACF",
  8 => "ABCDEFG",
  9 => "ABCDFG",
}
inputs= ARGF.readlines.map { _1.strip.split(' | ').map(&:split) }
uniq_lens = known.values.group_by {_1.length}.reject {_2.length > 1 }.keys.to_set
p inputs.map {|input,problem| problem.map(&:length).select {uniq_lens.include? _1}.count }.sum
