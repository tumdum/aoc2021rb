nums = ARGF.readlines.map(&:strip)
a = nums.dup
b = nums.dup
(0..nums[0].length-1).each {|d|
  if a.length > 1
    af = { "0" => [], "1" => [] }
    a.each {|n|
      af[n[d]].append(n)
    }
    if af['1'].length > af['0'].length
      a = af['1']
    elsif af['1'].length < af['0'].length
      a = af['0']
    else
      a = af['1']
    end
  end

  if b.length > 1
    bf = { "0" => [], "1" => [] }
    b.each {|n|
      bf[n[d]].append(n)
    }
    if bf['1'].length > bf['0'].length
      b = bf['0']
    elsif bf['1'].length < bf['0'].length
      b = bf['1']
    else
      b = bf['0']
    end
  end
}
p a[0].to_i(2) * b[0].to_i(2)
