dist = depth = aim = 0
ARGF.readlines.map(&:strip).each {|l|
  cmd, val = l.split ' '
  case cmd
  when 'down'
    aim += val.to_i
  when 'up'
    aim -= val.to_i
  when 'forward'
    dist += val.to_i
    depth += aim * val.to_i
  end
}
p depth * dist

