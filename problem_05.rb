# DOESNT WORK OR WORKS VERY SLOWLY
# Problem 5
# 
# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
# 
# What is the smallest number that is evenly divisible by all of the numbers
# from 1 to 20?

require 'rubygems'
require 'pp'

def smallest_number_divisible_by_all_up_to(number)
  time_start = Time.now

  starting        = number
  possible_answer = 0
  range           = []
  number.downto(1) { |x| range << x }

  divisible = false

  while !(answer ||= nil)
    possible_answer += number
    divisible = false
    range.each do |number|
      unless (starting%number == 0)
        divisible = true
        break
      end
    end
    answer = possible_answer unless divisible
  end

  time_end = Time.now
  duration = time_end - time_start

  pp "Smallest number evenly divisible by all up to #{starting}: #{answer}"
  pp "Duration: #{duration}"
end

smallest_number_divisible_by_all_up_to(10)