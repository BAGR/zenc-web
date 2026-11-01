+++
title = "Almost prime"
+++

# Almost prime



```zc
import "std/vec.zc"

fn k_prime(n: int, k: int) -> bool {
    let nf = 0;
    for i in 2..=n {
        while !(n % i) {
            if nf++ == k { return false; }
            n /= i;
        }
    }
    return nf == k;
}

fn gen(k: int, n: int) -> Vec<int> {
    let r = Vec<int>::new();
    let len = n;
    n = 2;
    for _ in 0..len {
        while !k_prime(n, k) { n++; }
        r << n++;
    }
    return r;
}

fn main() {
    for i in 1..6 {
        print "{i} [";
        let res = gen(i, 10);
        for j in res { print "{j}, "; }
        println "\b\b]";
    }
}
```

**Output:**

```
1 [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] 
2 [4, 6, 9, 10, 14, 15, 21, 22, 25, 26] 
3 [8, 12, 18, 20, 27, 28, 30, 42, 44, 45] 
4 [16, 24, 36, 40, 54, 56, 60, 81, 84, 88]
5 [32, 48, 72, 80, 108, 112, 120, 162, 168, 176]
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Almost prime**](https://rosettacode.org/wiki/Almost_prime) in Zen C.

*This article uses material from the Rosetta Code article **Almost prime**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Almost_prime?action=history).*
