# Problem 9
# 
# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# a^2 + b^2 = c^2
# 
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

require 'rubygems'
require 'pp'

def product_of_pythagorean_triplet_for(number)
  time_start = Time.now

  triplet = [nil,nil,nil]

  sum = number
  (1..sum).each do |c|
    (1..c).each do |b|
      (1..b).each do |a|
        next unless (a+b+c == sum)
        next unless (a**2+b**2 == c**2)
        triplet = [a,b,c]
        break if !triplet[0].nil?
      end
      break if !triplet[0].nil?
    end
    break if !triplet[0].nil?
  end

  product = triplet.inject(1) do |prod, factor|
    prod * factor
  end

  time_end = Time.now
  duration = time_end - time_start

  pp "Product of triplet #{triplet.join(',')} for sum #{number} is #{product}."
  pp "Duration: #{duration}"
end

product_of_pythagorean_triplet_for(1000)