+++
title = "Prime numbers of measurement"
+++

# Prime numbers of measurement

This is based on the C++ code in the OEIS page.

```zc
import "std/vec.zc"

fn binary_search(a: Vec<int>*, value: int, low: int, high: int) -> int {
    let l = low;
    let h = high;
    while l <= h {
        let mid = l + (h - l) / 2;
        if a.get(mid) > value {
            h = mid - 1;
        } else if a.get(mid) < value {
            l = mid + 1;
        } else {
            return mid;
        }
    }
    return -1;
}

fn remove_element(a: Vec<int>*, v: int) {
    let ix = binary_search(a, v, 0, (int)a.length() - 1);
    if ix >= 0 { a.remove(ix) };
}

fn main() {
    def NMAX = 3200;
    let a = Vec<int>::with_capacity(NMAX);
    for i in 0..NMAX { a << (i + 1); }
    for piv in 2..a.length() {
        for let i = 0; i < piv - 1 && i < a.length() - 1; ++i {
            let su = a[i] + a[i + 1];
            remove_element(&a, su);
            for let j = i + 2; j < piv && j < a.length(); ++j {
                su += a[j];
                remove_element(&a, su);
                if su > NMAX { break; }
            }
        }
    }
    println "First hundred:";
    for i in 0..100 {
        print "{a[i]:3d}  ";
        if !((i + 1) % 10) { println ""; }
    }
    println "\nOne thousandth: {a[999]}";
}
```

**Output:**

```
First hundred:
  1    2    4    5    8   10   14   15   16   21  
 22   25   26   28   33   34   35   36   38   40  
 42   46   48   49   50   53   57   60   62   64  
 65   70   77   80   81   83   85   86   90   91  
 92  100  104  107  108  116  119  124  127  132  
133  137  141  144  145  148  150  151  154  158  
159  163  165  172  173  174  175  178  180  182  
184  187  188  195  198  201  206  207  208  213  
219  221  222  226  228  231  233  236  241  242  
245  247  248  253  256  262  266  268  272  274  

One thousandth: 3165
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Prime numbers of measurement**](https://rosettacode.org/wiki/Prime_numbers_of_measurement) in Zen C.

*This article uses material from the Rosetta Code article **Prime numbers of measurement**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Prime_numbers_of_measurement?action=history).*
