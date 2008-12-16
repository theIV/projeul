#include <stdio.h>
#include <math.h>

int main() {
  first_triangle_number_over_x_divisors(500);
}

int first_triangle_number_over_x_divisors(divisors) {
  int seed, divisors_used, value, triangle;
  seed = 1;
  divisors_used = 0;
  value = 0;

  while(divisors_used < divisors) {
    triangle = triangle_number(seed);
    divisors_used = number_of_divisors_for(triangle);
    value = triangle;
    seed += 1;
  }
  printf("%d\n",value);
}

// void divisors_of(number) {
//   int divisors[];
//   1.upto(number) do |divisor|
//     divisors << divisor if number%divisor == 0
//   end
//   return divisors
// }

int number_of_divisors_for(number) {
  int number_of_divisors;
  number_of_divisors = 0;
  int x;
  for(x = 1; x < number; x++) {
    if(number%x == 0) {
      number_of_divisors += 1;
    }
  }
  return number_of_divisors;
}

int triangle_number(seed) {
  int value;
  value = 0;
  int x;
  for(x = 1; x < seed; x++) {
    value += x;
  }
  return value;
}