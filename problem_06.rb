# Problem 6
# 
# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025

# Hence the difference between the sum of the squares of the first ten natural
# numbers and the square of the sum is 3025  385 = 2640.
# 
# Find the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.

require 'rubygems'
require 'pp'

def difference_of_sums(amount)
  time_start = Time.now

  sum_of_squares = 0
  sum_of_amount  = 0
  square_of_sums = 0

  1.upto(amount) { |x| sum_of_squares  += x*x }
  1.upto(amount) { |x| sum_of_amount   += x }
  square_of_sums = sum_of_amount*sum_of_amount

  difference = square_of_sums - sum_of_squares

  time_end = Time.now
  duration = time_end - time_start

  pp "Difference between the sum of squares and the square of sums for the first #{amount} natural numbers is: #{difference}"
  pp "Duration: #{duration}"
end

difference_of_sums(100)