gamma = ""
epsilon = ""
nums = ARGF.readlines.map(&:strip)
(0..nums[0].length-1).each {|d|
  f = Hash::new(0)
  nums.each {|n|
    f[n[d]] += 1
  }
  if f['1'] > f['0']
    gamma += "1"
    epsilon += "0"
  else
    gamma += "0"
    epsilon += "1"
  end
}

p gamma.to_i(2) * epsilon.to_i(2)
