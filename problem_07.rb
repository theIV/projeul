# Problem 7
# 
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.

# What is the 10001st prime number?

require 'rubygems'
require 'pp'

def prime_number_index(number)
  time_start = Time.now

  index = 0
  prime = 0
  starting_number = 1

  while index != number
    if is_a_prime?(starting_number)
      prime, index = starting_number, index
      index += 1
    end
    starting_number += 1
  end

  time_end = Time.now
  duration = time_end - time_start

  pp "Prime at index #{number}: #{prime}"
  pp "Duration: #{duration}"
end

def is_a_prime?(number)
  if    number == 1     then return false
  elsif number < 4      then return true
  elsif number % 2 == 0 then return false
  elsif number < 9      then return true
  elsif number % 3 == 0 then return false
  else
    5.step(Math.sqrt(number).to_i, 2) do |x|
      return false if number % x == 0
    end
  end
  return true
end

prime_number_index(10001)