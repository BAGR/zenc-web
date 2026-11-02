+++
title = "Ascending primes"
+++

# Ascending primes


A translation of the second version.

```zc
import "std/vec.zc"
import "std/sort.zc"

fn is_prime(n: int) -> bool {
    if n < 2      { return false; }
    if n % 2 == 0 { return n == 2; }
    if n % 3 == 0 { return n == 3; }
    let d = 5;
    while d * d <= n {
        if n % d == 0 { return false; }
        d += 2;
        if n % d == 0 { return false; }
        d += 4;
    }
    return true;
}

let asc_primes: Vec<int>;

fn generate(first: int, cand: int, digits: int) {
    if !digits {
        if is_prime(cand) && !asc_primes.contains(cand) { asc_primes << cand; }
        return;
    }
    for let i = first;  i <= 9; ++i  {
        let next = cand * 10 + i;
        generate(i + 1, next, digits - 1);
    }
}

fn main() {
    asc_primes = Vec<int>::new();
    for digits in 1..10 { generate(1, 0, digits); }
    let len = asc_primes.length();
    sort_int(asc_primes.data, len);
    println "There are {len} ascending primes, namely:";
    for i in 0..len {
        print "{asc_primes[i]:8d} ";
        if !((i + 1) % 10) { println ""; }
    }
    asc_primes.free();
}
```

**Output:**

```
There are 100 ascending primes, namely:
       2        3        5        7       13       17       19       23       29       37 
      47       59       67       79       89      127      137      139      149      157 
     167      179      239      257      269      347      349      359      367      379 
     389      457      467      479      569     1237     1249     1259     1279     1289 
    1367     1459     1489     1567     1579     1789     2347     2357     2389     2459 
    2467     2579     2689     2789     3457     3467     3469     4567     4679     4789 
    5689    12347    12379    12457    12479    12569    12589    12689    13457    13469 
   13567    13679    13789    15679    23459    23567    23689    23789    25679    34589 
   34679   123457   123479   124567   124679   125789   134789   145679   234589   235679 
  235789   245789   345679   345689  1234789  1235789  1245689  1456789 12356789 23456789
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Ascending primes**](https://rosettacode.org/wiki/Ascending_primes) in Zen C.

*This article uses material from the Rosetta Code article **Ascending primes**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Ascending_primes?action=history).*
