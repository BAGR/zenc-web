+++
title = "Anti-primes"
+++

# Anti-primes



```zc
fn divisor_count(n: int) -> int {
    let i = 1;
    let k = (n % 2 == 0) ? 1 : 2;
    let count = 0;
    while i * i <= n {
        if n % i == 0 {
            count++;
            let j = n / i;
            if j != i { count++; }
        }
        i += k;
    }
    return count;
}

fn main() {
    println "The first 20 anti-primes are:";
    let max_div = 0;
    let count = 0;
    for let n = 1; count < 20; ++n {
        let d = divisor_count(n);
        if d > max_div {
            print "{n} ";
            max_div = d;
            count++;
        }
    }
    println "";
}
```

**Output:**

```
The first 20 anti-primes are:
1 2 4 6 12 24 36 48 60 120 180 240 360 720 840 1260 1680 2520 5040 7560
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Anti-primes**](https://rosettacode.org/wiki/Anti-primes) in Zen C.

*This article uses material from the Rosetta Code article **Anti-primes**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Anti-primes?action=history).*
