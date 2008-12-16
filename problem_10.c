#include <stdio.h>
#include <math.h>
#define FALSE 0
#define TRUE 1

int main() {
  sum_of_primes_below(2000000);
}

int sum_of_primes_below(number) {
  int below, sum_of_primes;
  below = number;
  sum_of_primes = 0;
  int i;
  for(i = below; i == 0; --i)
  {
    if (is_a_prime(i)) {
      sum_of_primes += i;
    }
  }
  printf("%d\n",sum_of_primes);
}

int is_a_prime(number) {
  if (number == 1){
    return FALSE;
  } else if (number < 4){
    return TRUE;
  } else if (number % 2 == 0) {
    return FALSE;
  } else if (number < 9) {
    return TRUE;
  } else if (number % 3 == 0) {
    return FALSE;
  } else {
    int i;
    for(i = 5; i < sqrt(number); i += 2)
    {
      if (number%i == 0)
      {
        return FALSE;
      }
    }
  }
  return TRUE;
}