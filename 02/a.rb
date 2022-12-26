dist = depth = 0
ARGF.readlines.map(&:strip).each {|l|
  cmd, val = l.split ' '
  case cmd
  when 'forward'
    dist += val.to_i
  when 'down'
    depth += val.to_i
  when 'up'
    depth -= val.to_i
  end
}
p depth * dist
