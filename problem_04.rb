# Problem 4
# 
# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91  99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

require 'rubygems'
require 'pp'

def is_a_palindrome?(number)
  number = number.to_s
  middle = number.length/2
  return number[0,middle] == number[middle,number.length].reverse
end

def largest_palindromic_number_for_x_digits(number_of_digits)
  time_start = Time.now

  largest_palindrome  = 0

  starting_number     = String.new
  ending_number       = "1"

  number_of_digits.times { starting_number << "9" }
  starting_number = starting_number.to_i
  (number_of_digits-1).times { ending_number << "0" }
  ending_number = ending_number.to_i

  ending_number.upto(starting_number) do |ending|
    ending.upto(starting_number) do |number|
      result = ending * number
      if is_a_palindrome?(result)
        largest_palindrome = result if result > largest_palindrome
      end
    end
  end

  time_end = Time.now
  duration = time_end - time_start

  pp "Largest palindrome for #{number_of_digits}: #{largest_palindrome}"
  pp "Duration: #{duration}"
end

largest_palindromic_number_for_x_digits(3)