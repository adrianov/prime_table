A simple program that takes integer N as input and outputs a table.
Table size is (N+1)x(N+1): first row and first column contain the first N prime number.
Inner cells contain the multiple of the two primes for the corresponding row and column.

Example:
```
> ruby prime_table.rb 3
|   |  2 |  3 |  5 |
| 2 |  4 |  6 | 10 |
| 3 |  6 |  9 | 15 |
| 5 | 10 | 15 | 25 |

> ruby prime_table.rb 4
|   |  2 |  3 |  5 |  7 |
| 2 |  4 |  6 | 10 | 14 |
| 3 |  6 |  9 | 15 | 21 |
| 5 | 10 | 15 | 25 | 35 |
| 7 | 14 | 21 | 35 | 49 |
```

Implementation notes:
* It uses Ruby and RSpec for tests.
* It does NOT use any gems for prime numbers.
* It is implemented as command line program.
