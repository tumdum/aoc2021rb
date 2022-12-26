p ARGF.readlines.map(&:strip).map(&:to_i).each_cons(3).map { _1 + _2 + _3}.each_cons(2).select { _1 < _2 }.count
