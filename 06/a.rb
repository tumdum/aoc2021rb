require '../aoc'

state = ARGF.readline.ints.tally
state.default = 0

def sim(state, steps)
  state = state.dup
  steps.times {
    new = state[0]
    (1..8).each {|n|
      state[n-1] = state[n]
    }
    state[6] += new
    state[8] = new
  }
  state
end

p sim(state, 80).values.sum
