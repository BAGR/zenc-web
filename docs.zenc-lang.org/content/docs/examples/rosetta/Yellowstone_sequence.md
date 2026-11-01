+++
title = "Yellowstone sequence"
+++

# Yellowstone sequence



```zc
import "std/set.zc"

fn gcd(x: int, y: int) -> int {
    while y {
        let t = y;
        y = x % y;
        x = t;
    }
    return x >= 0 ? x :-x;
}

fn yellowstone(n: int, a: int*) {
    let s = Set<int>::new();
    for i in 1..4 {
        a[i] = i;
        s.add(i);
    }
    let min = 4;
    for c in 4..=n {
        for let i = min; ; ++i {
            if !s.contains(i) && gcd(a[c - 1], i) == 1 && gcd(a[c - 2], i) > 1 {
                a[c] = i;
                s.add(i);
                if i == min { min++; }
                break;
            }
        }
    }
}

fn main() {
    let x: int[30];
    for i in 0..30 { x[i] = i + 1; }
    let a: [int; 31];
    yellowstone(30, (int*)a);
    println "The first 30 Yellowstone numbers are:";
    for i in 1..=30 {
        print "{a[i]:2d}  ";
        if !(i % 10) { println ""; }
    }
}
```

**Output:**

```
The first 30 Yellowstone numbers are:
 1   2   3   4   9   8  15  14   5   6  
25  12  35  16   7  10  21  20  27  22  
39  11  13  33  26  45  28  51  32  17
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Yellowstone sequence**](https://rosettacode.org/wiki/Yellowstone_sequence) in Zen C.

*This article uses material from the Rosetta Code article **Yellowstone sequence**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Yellowstone_sequence?action=history).*
