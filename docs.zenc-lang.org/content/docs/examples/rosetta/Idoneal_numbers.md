+++
title = "Idoneal numbers"
+++

# Idoneal numbers



```zc
fn is_idoneal(n: int) -> bool {
    for a in 1..n {
        for b in (a + 1)..n {
            if a * b + a + b > n { break; }
            for c in (b + 1)..n {
                let sum = a * b + b * c + a * c;
                if sum == n { return false; }
                if sum > n  { break; }
            }
        }
    }
    return true;
}

fn main() {
    let count = 0;
    for let n = 1; count < 65; ++n {
        if is_idoneal(n) {
            print "{n:4d} ";
            if !(++count % 10) { println ""; }
        }
    }
    println "\n\nFound all {count} known Idoneal numbers.";
}
```

**Output:**

```
1    2    3    4    5    6    7    8    9   10 
  12   13   15   16   18   21   22   24   25   28 
  30   33   37   40   42   45   48   57   58   60 
  70   72   78   85   88   93  102  105  112  120 
 130  133  165  168  177  190  210  232  240  253 
 273  280  312  330  345  357  385  408  462  520 
 760  840 1320 1365 1848 

Found all 65 known Idoneal numbers.
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Idoneal numbers**](https://rosettacode.org/wiki/Idoneal_numbers) in Zen C.

*This article uses material from the Rosetta Code article **Idoneal numbers**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Idoneal_numbers?action=history).*
