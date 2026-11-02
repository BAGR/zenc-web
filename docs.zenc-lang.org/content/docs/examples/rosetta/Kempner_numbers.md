+++
title = "Kempner numbers"
+++

# Kempner numbers



```zc
import "std/vec.zc"
import "locale.h"

fn prime_factors(n: u64) -> Vec<u64> {
    let factors = Vec<u64>::new();
    if n < 2 { return factors; }
    let inc: u64[8] = [4, 2, 4, 2, 4, 6, 2, 6];
    while n % 2 == 0 {
        factors << 2;
        n /= 2;
    }
    while n % 3 == 0 {
        factors << 3;
        n /= 3;
    }
    while n % 5 == 0 {
        factors << 5;
        n /= 5;
    }
    let k: u64 = 7;
    let i: usize = 0;
    while k * k <= n {
        if n % k == 0 {
            factors << k;
            n /= k;
        } else {
            k += inc[i];
            i = (i + 1) % 8;
        }
    }
    if n > 1 { factors << n; }
    return factors;
}

fn prime_powers(n: u64) -> Vec<(u64, int)> {
    let res = Vec<(u64, int)>::new();
    let factors = prime_factors(n);
    if factors.length() == 0 return res;
    let prev = factors[0];
    res << (prev, 1);
    for i in 1..factors.length() {
        let f = factors[i];
        if f == prev {
            let t = res.last();
            res[res.length() - 1] = ((u64)t.0, t.1 + 1);
        } else {
            res << (f, 1);
        }
        prev = f;
    }
    return res;
}

fn valp(n: u64, p: u64) -> u64 {
    let s: u64 = 0;
    while n != 0 {
        n /= p;
        s += n;
    }
    return s;
}

fn K(p: u64, e: u64) -> u64 {
    if e <= p { return e * p; }
    let t = (e * (p - 1) / p) * p;
    while valp(t, p) < e { t += p; }
    return t;
}

fn kempner(n: u64) -> u64 {
    if n == 1 { return 1; }
    let items = Vec<u64>::new();
    let pps = prime_powers(n);
    for pp in pps {
        let (p, e) = pp;
        items << K(p, e);
    }
    let max = items[0];
    for i in 1..items.length() {
        if items[i] > max { max = items[i]; }
    }
    return max;
}

fn main() {
    println "The first 50 Kempner numbers are:";
    for n in 1..=50 {
        print "{kempner(n):2lu}  ";
        if !(n % 10) { println ""; }
    }

    setlocale(LC_NUMERIC, "");
    println "\nKempner numbers for the range 77135679311 to 77135679321:";
    for n in 77135679311..=77135679321 {
        println "S({n}) = {kempner(n):'14lu}";
    }
}
```

**Output:**

```
The first 50 Kempner numbers are:
 1   2   3   4   5   3   7   4   6   5  
11   4  13   7   5   6  17   6  19   5  
 7  11  23   4  10  13   9   7  29   5  
31   8  11  17   7   6  37  19  13   5  
41   7  43  11   6  23  47   6  14  10  

Kempner numbers for the range 77135679311 to 77135679321:
S(77135679311) =         18,191
S(77135679312) =     39,194,959
S(77135679313) =            787
S(77135679314) =          1,193
S(77135679315) =        124,909
S(77135679316) =         88,667
S(77135679317) =  4,537,392,901
S(77135679318) = 12,855,946,553
S(77135679319) =  2,659,851,011
S(77135679320) =      8,886,599
S(77135679321) =        100,237
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Kempner numbers**](https://rosettacode.org/wiki/Kempner_numbers) in Zen C.

*This article uses material from the Rosetta Code article **Kempner numbers**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Kempner_numbers?action=history).*
