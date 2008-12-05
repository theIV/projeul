# Problem 3
# 
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

require 'rubygems'
require 'pp'

def problem3(large_number)
  time_start = Time.now

  prime_factor = 0

  Math.sqrt(large_number).to_i.downto(1) do |x|
    if large_number % x == 0
      if is_a_prime?(x.to_i)
        prime_factor = x
        break
      end
    end
  end

  time_end = Time.now
  duration = time_end - time_start

  pp "Largest prime factor of #{large_number}: #{prime_factor}"
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

problem3(600851475143)