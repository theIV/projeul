# Problem 16
#
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# 
# What is the sum of the digits of the number 2^1000?

require 'rubygems'
require 'pp'
require 'mathn'

digits        = 2**1000
digits_string = digits.to_s
sum           = 0

0.upto(digits_string.length) do |index|
  unless digits_string[index,1].nil?
    sum += digits_string[index,1].to_i
  end
end

pp sum