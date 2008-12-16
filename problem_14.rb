# Problem 14
#
# The following iterative sequence is defined for the set of positive integers:
# 
# n  n/2 (n is even)
# n  3n + 1 (n is odd)
# 
# Using the rule above and starting with 13, we generate the following sequence:
# 13  40  20  10  5  16  8  4  2  1
# It can be seen that this sequence (starting at 13 and finishing at 1)
# contains 10 terms.
# Although it has not been proved yet (Collatz Problem), it is thought that all
# starting numbers finish at 1.
# 
# Which starting number, under one million, produces the longest chain?
# 
# NOTE: Once the chain starts the terms are allowed to go above one million.

require 'rubygems'
require 'pp'

def problem14(starting)
  time_start = Time.now

  longest_chain = 0
  value         = 0

  starting.downto(1) do |number|
    chain_length = chain_length(number)
    if chain_length > longest_chain
      longest_chain = chain_length
      value         = number
    end
  end

  time_end = Time.now
  duration = time_end - time_start

  pp longest_chain, value
  pp "Duration: #{duration}"
end

def chain_length(starting_number)
  chain = []
  value = starting_number
  until value == 1
    value = next_in_chain(value)
    chain << value
  end
  chain.length
end

def next_in_chain(number)
  next_value = 0
  if number%2 == 0
    next_value = number/2
  else
    next_value = (3*number)+1
  end
  next_value
end

problem14(1000000)