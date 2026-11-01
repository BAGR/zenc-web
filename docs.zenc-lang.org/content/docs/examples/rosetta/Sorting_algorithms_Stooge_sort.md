+++
title = "Sorting algorithms/Stooge sort"
+++

# Sorting algorithms/Stooge sort

```zc
fn stooge_sort(a: int*, i: int, j: int) {
    if a[j] < a[i] {
        let t = a[i];
        a[i] = a[j];
        a[j] = t;
    }
    if j - i > 1 {
        let t = (j - i + 1) / 3;
        stooge_sort(a, i, j - t);
        stooge_sort(a, i + t, j);
        stooge_sort(a, i, j - t);
    }
}

fn main() {
    let a1 = [4, 65, 2, -31, 0, 99, 2, 83, 782, 1];
    let a2 = [7, 5, 2, 6, 1, 4, 2, 6, 3];
    let aa: int*[2] = [a1, a2];
    let lens = [a1.len, a2.len];
    for i in 0..aa.len {
        print "Before: [";
        for j in 0..lens[i] { print "{aa[i][j]}, "; }
        println "\b\b]";
        stooge_sort(aa[i], 0, lens[i] - 1);
        print "After : [";
        for j in 0..lens[i] { print "{aa[i][j]}, "; }
        println "\b\b]\n";
    }
}
```

**Output:**

```
Before: [4, 65, 2, -31, 0, 99, 2, 83, 782, 1] 
After : [-31, 0, 1, 2, 2, 4, 65, 83, 99, 782] 

Before: [7, 5, 2, 6, 1, 4, 2, 6, 3] 
After : [1, 2, 2, 3, 4, 5, 6, 6, 7]
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Sorting algorithms/Stooge sort**](https://rosettacode.org/wiki/Sorting_algorithms/Stooge_sort) in Zen C.

*This article uses material from the Rosetta Code article **Sorting algorithms/Stooge sort**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Sorting_algorithms/Stooge_sort?action=history).*
