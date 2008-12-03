# Problem 1
# 
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000.

require 'rubygems'
require 'pp'

MULTIPLES_OF  = [3,5]
LESS_THAN     = 1000

in_list           = Array.new(LESS_THAN,false)
sum_of_multiples  = 0

MULTIPLES_OF.each do |multiple|
  LESS_THAN.downto(0) do |number|
    if number%multiple == 0 && in_list[number] == false
      in_list[number] = true
      sum_of_multiples += number
    end
  end
end

pp "Sum of multiples: #{sum_of_multiples.to_s}"