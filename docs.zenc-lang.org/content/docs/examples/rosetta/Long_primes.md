+++
title = "Long primes"
+++

# Long primes



```zc
import "std/vec.zc"
import "std/math.zc"

fn prime_sieve(n: int) -> Vec<int> {
    let primes = Vec<int>::new();
    if n < 2 { return primes; }
    primes << 2;
    if n == 2 { return primes; }
    let k = (n - 3) / 2 + 1;
    autofree let marked = (bool*)malloc(k * sizeof(bool));
    for i in 0..k { marked[i] = true; }
    let limit = ((int)Math::sqrt((f64)n) - 3) / 2 + 1;
    if limit < 0 { limit = 0; }
    for i in 0..limit {
        if marked[i] {
            let p = 2 * i + 3;
            let s = (p * p - 3) / 2;
            while s < k {
                marked[s] = false;
                s += p;
            }
        }
    }
    for i in 0..k {
        if marked[i] { primes << (2 * i + 3); }
    }
    return primes;
}

// Finds the period of the reciprocal of n.
fn find_period(n: int) -> int {
    let r = 1;
    for i in 1..=(n+1) r = (10 * r) % n;
    let rr = r;
    let period = 0;
    let ok = true;
    while ok {
        r = (10 * r) % n;
        period++;
        ok = (r != rr);
    }
    return period;
}

fn main() {
    let primes = prime_sieve(64000)
    primes.remove(0);
    let long_primes = Vec<int>::new();
    for prime in primes {
        if find_period(prime) == prime - 1 { long_primes << prime; }
    }
    let numbers: int[8] = [500, 1000, 2000, 4000, 8000, 16000, 32000, 64000];
    let index = 0;
    let count = 0;
    let totals: [int; 8];
    for long_prime in long_primes {
        if long_prime > numbers[index] {
            totals[index++] = count;
        }
        count++;
    }
    totals[7] = count;
    println "The long primes up to {numbers[0]} are: ";
    for i in 0..totals[0] { print "{long_primes[i]} "; }

    println "\n\nThe number of long primes up to:";
    for i, total in totals {
        println "  {numbers[i]:5d} is {total}";
    }
}
```

**Output:**

```
The long primes up to 500 are: 
7 17 19 23 29 47 59 61 97 109 113 131 149 167 179 181 193 223 229 233 257 263 269 313 337 367 379 383 389 419 433 461 487 491 499 

The number of long primes up to:
    500 is 35
   1000 is 60
   2000 is 116
   4000 is 218
   8000 is 390
  16000 is 716
  32000 is 1300
  64000 is 2430
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Long primes**](https://rosettacode.org/wiki/Long_primes) in Zen C.

*This article uses material from the Rosetta Code article **Long primes**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Long_primes?action=history).*
