# Problem 17
#
# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# 
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out
# in words, how many letters would be used?
# 
# 
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
# forty-two) contains 23 letters and 115 (one hundred and fifteen) contains
# 20 letters. The use of "and" when writing out numbers is in compliance with
# British usage.
# 
# INCOMPLETE MESS

require 'rubygems'
require 'pp'

@number_to_letter_map =
{
  "1"  => "one",
  "2"  => "two",
  "3"  => "three",
  "4"  => "four",
  "5"  => "five",
  "6"  => "six",
  "7"  => "seven",
  "8"  => "eight",
  "9"  => "nine",
 "10"  => "ten",
 "11"  => "eleven",
 "12"  => "twelve",
 "13"  => "thirteen",
 "14"  => "fourteen",
 "15"  => "fifteen",
 "16"  => "sixteen",
 "17"  => "seventeen",
 "18"  => "eighteen",
 "19"  => "nineteen",
 "20"  => "twenty",
 "30"  => "thirty",
 "40"  => "forty",
 "50"  => "fifty",
 "60"  => "sixty",
 "70"  => "seventy",
 "80"  => "eighty",
 "90"  => "ninety",
"100"  => "hundred",
"1000" => "one thousand"
}

def up_to_twenty(number)
  pp "hit me twenty #{number}"
  if number == 0
    return 0
  else
    return @number_to_letter_map[number.to_s].length
  end
end

def up_to_hundred(number)
  if number < 20
    return up_to_twenty(number)
  else
    pp "hit me hundred #{number}"
    characters = 0
    base = number/10.to_f.to_i
    remainder = number%10
    characters = @number_to_letter_map[base.to_s].length
    return characters, remainder
  end
end

def up_to_thousand(number)
  pp "hit me thousand #{number}"
  characters = 0
  base = number/100.to_f.to_i
  remainder = number%100
  pp "thousand: "+ @number_to_letter_map[base.to_s]
  characters  = @number_to_letter_map[base.to_s].length
  characters += @number_to_letter_map[100.to_s].length
  return characters, remainder
end

def construct_word_from(number,limit)
  word = ""
  case number
  when 1..20
    word = @number_to_letter_map[number.to_s]
  when 21..99
    base = number/10.to_f.to_i * 10
    pp base
    remainder = number%10
    pp remainder
    word = @number_to_letter_map[base.to_s]
    word << @number_to_letter_map[remainder.to_s] unless remainder == 0
  when 100
    word = @number_to_letter_map[1.to_s]
    word << @number_to_letter_map[number.to_s]
  when 101..limit-1
    hundred_base = number/100.to_f.to_i * 100
    word = @number_to_letter_map[hundred_base.to_s]
    word << "and"
    remainder = number%100
    if remainder > 20
      ten_base = remainder/10.to_f.to_i
      remainder_ten = number%10
      word << @number_to_letter_map[ten_base.to_s]
      word << @number_to_letter_map[remainder_ten.to_s]
    else
      word << @number_to_letter_map[remainder.to_s]
    end
  else
    pp "Nothing"
  end
  pp word
end

def problem17(how_far)

  1.upto(how_far) do |number|
    construct_word_from(number,how_far)
  end

  # number_of_characters = 0
  # 
  # 1.upto(how_far) do |number|
  #   case number
  #   when 1..20  then
  #     number_of_characters += up_to_twenty(number)
  #   when 21..99 then
  #     characters, remainder = up_to_hundred(number)
  #     number_of_characters += characters
  #     number_of_characters += up_to_twenty(remainder)
  #   when 100 then
  #     number_of_characters += @number_to_letter_map[number.to_s].length
  #     number_of_characters += @number_to_letter_map[1.to_s].length
  #   when 101..how_far-1
  #     characters1, remainder1 = up_to_thousand(number)
  #     number_of_characters += characters1
  #     characters2, remainder2 = up_to_hundred(remainder1) unless remainder1.nil?
  #     number_of_characters += characters2
  #     number_of_characters += up_to_twenty(remainder2) unless remainder2.nil?
  #     number_of_characters += "and".length
  #   when how_far
  #     number_of_characters += @number_to_letter_map[number.to_s].length
  #   else
  #     return "Can't figure it out."
  #   end
  # end
  # pp number_of_characters
end

problem17(1000)