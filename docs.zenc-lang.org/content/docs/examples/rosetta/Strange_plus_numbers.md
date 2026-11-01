+++
title = "Strange plus numbers"
+++

# Strange plus numbers

```zc
import "std/vec.zc"

fn digits(n: int) -> Vec<int> {
    let digs = Vec<int>::new();
    if n == 0 {
        digs << 0;
        return digs;
    }
    while n > 0 {
        digs << (n % 10);
        n /= 10;
    }
    digs.reverse();
    return digs;
}

let primes: const int[7] = [2, 3, 5, 7, 11, 13, 17];

fn is_prime(n: int) -> bool {
    for p in primes { if n == p { return true; } }
    return false;
}

fn main() {
    println "Strange plus numbers between 101 and 499 inclusive:"
    let count = 0;
    for n in 101..500 {
        let d = digits(n);
        if is_prime(d[0] + d[1]) && is_prime(d[1] + d[2]) {
            print "{n} ";
            if !(++count % 10) { println ""; }
        }
    }
    println "\n\nFound {count} such numbers.";
}
```

**Output:**

```
Strange plus numbers between 101 and 499 inclusive:
111 112 114 116 120 121 123 125 129 141 
143 147 149 161 165 167 202 203 205 207 
211 212 214 216 230 232 234 238 250 252 
256 258 292 294 298 302 303 305 307 320 
321 323 325 329 341 343 347 349 383 385 
389 411 412 414 416 430 432 434 438 470 
474 476 492 494 498 

Found 65 such numbers.
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Strange plus numbers**](https://rosettacode.org/wiki/Strange_plus_numbers) in Zen C.

*This article uses material from the Rosetta Code article **Strange plus numbers**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Strange_plus_numbers?action=history).*
