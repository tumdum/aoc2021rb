letters = "abcdefg"
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
knowni = known.invert
chars_to_count = known.values.flatten.join.chars.tally
count_to_chars = known.values.flatten.join.chars.tally.to_a.group_by { _2 }.map {|k,v| [k, v.map {_1[0]}]}.to_h
inputs= ARGF.readlines.map { _1.strip.split(' | ').map(&:split) }
numbers = inputs.map {|input,problem|
  map = {
    "A" => letters.chars.to_set,
    "B" => letters.chars.to_set,
    "C" => letters.chars.to_set,
    "D" => letters.chars.to_set,
    "E" => letters.chars.to_set,
    "F" => letters.chars.to_set,
    "G" => letters.chars.to_set,
  }
  # Filter using unique segments count in some digits
  input_by_len = input.group_by {_1.length}
  known_by_len = known.values.group_by {_1.length }
  input_by_len.each {|k,v|
    if v.length == 1
      # puts "\t#{k} #{v[0]} #{known_by_len[k][0]}"
      known_by_len[k][0].chars.each {|c|
        map[c] = map[c] & v[0].chars.to_set
        # puts "\t\t#{c}: #{map[c]}"
      }
    end
  }
  map['A'] = map['A'] - map['C']
  map.keys.each {|k|
    if k != 'A'
      map[k] = map[k] - map['A']
    end
  }
  map.keys.each {|k|
    if k != 'C' && k != 'F'
      map[k] = map[k] - map['C']
    end
  }

  # Filter using unique number of times some segments are used across all digits

  count_to_input_chars = input.flatten.join.chars.tally.to_a.group_by { _2 }.map {|k,v| [k, v.map {_1[0]}]}.to_h
  rest = {}
  count_to_input_chars.each {|count,chars|
    if chars.length == 1
      # puts "#{chars[0]} happens to be used #{count} times, just like #{count_to_chars[count][0]}"
      map.keys.each {|k|
        s = Set.new([chars[0]])
        if k != count_to_chars[count][0]
          new = map[k] - s
          if new.length == 1 && map[k].length > 1
            rest[k] = new.first
          end
          map[k] = new
        else
          map[k] = s
        end
      }
    end
  }

  rest.each {|k,char|
    s = Set.new([char])
    map.keys.each {|k2|
      if k2 != k
        map[k2] = map[k2] - s
      end
    }
  }
  map = map.map {|k,v| [k, v.first]}.to_h
  mapi = map.invert
  problem.map{ knowni[_1.chars.map{|c| mapi[c]}.sort.join].to_s }.join.to_i
}
p numbers.sum
