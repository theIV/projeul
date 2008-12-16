# Problem 10
# 
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.

require 'rubygems'
require 'pp'

def sum_of_primes_below(number)
  time_start = Time.now

  below         = number
  sum_of_primes = 0

  number.downto(1) do |number|
    pp number
    sum_of_primes += number if is_a_prime?(number)
  end

  time_end = Time.now
  duration = time_end - time_start

  pp "Sum of primes below #{below} is #{sum_of_primes}."
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

sum_of_primes_below(2000000)

# require 'mathn'
# 
# def solution2
#   time_start = Time.now
# 
#   prime = Prime.new
#   sum_of_primes = 0
#   next_prime = prime.next
# 
#   until next_prime > 2000000
#     pp next_prime
#     sum_of_primes += next_prime
#     next_prime = prime.next
#   end
# 
#   time_end = Time.now
#   duration = time_end - time_start
# 
#   pp "Sum of primes below 2000000 is #{sum_of_primes}."
#   pp "Duration: #{duration}"
# end
# 
# solution2