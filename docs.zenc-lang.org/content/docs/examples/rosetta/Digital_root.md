+++
title = "Digital root"
+++

# Digital root

```zc
import "locale.h"

fn digit_sum(n: u64) -> int {
    let sum: u64 = 0;
    while n > 0 {
        sum += n % 10;
        n /= 10;
    }
    return (int)sum;
}

fn digital_root(n: u64) -> (int, int) {
    if n < 10 { return ((int)n, 0); }
    let dr = n;
    let ap = 0;
    while dr > 9 {
        dr = digit_sum(dr);
        ap++;
    }
    return ((int)dr, ap);
}

fn main() {
    setlocale(LC_NUMERIC, "");
    let a: u64[8] = [1, 14, 267, 8128, 627615, 39390, 588225, 393900588225];
    for n in a {
        let (dr, ap) = digital_root(n);
        println "{n:'15lu} has additive persistence {ap} and digital root of {dr}";
    }
}
```

**Output:**

```
1 has additive persistence 0 and digital root of 1
             14 has additive persistence 1 and digital root of 5
            267 has additive persistence 2 and digital root of 6
          8,128 has additive persistence 3 and digital root of 1
        627,615 has additive persistence 2 and digital root of 9
         39,390 has additive persistence 2 and digital root of 6
        588,225 has additive persistence 2 and digital root of 3
393,900,588,225 has additive persistence 2 and digital root of 9
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Digital root**](https://rosettacode.org/wiki/Digital_root) in Zen C.

*This article uses material from the Rosetta Code article **Digital root**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Digital_root?action=history).*
