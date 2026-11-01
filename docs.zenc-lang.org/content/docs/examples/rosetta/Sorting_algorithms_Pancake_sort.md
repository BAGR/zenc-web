+++
title = "Sorting algorithms/Pancake sort"
+++

# Sorting algorithms/Pancake sort



```zc
fn flip(a: int*, r: usize) {
    for let l: usize = 0; l < r; ++l {
        let t = a[l];
        a[l] = a[r];
        a[r--] = t;
    }
}

fn pancake_sort(a: int*, len: const usize) {
    for let uns: usize = len - 1; uns > 0; --uns {
        let lx = 0;
        let lg = a[0];
        for i in 1..=uns {
            if a[i] > lg {
                lx = i;
                lg = a[i];
            }
        }
        flip(a, lx);
        flip(a, uns);
    }
}

fn main() {
    let list = [31, 41, 59, 26, 53, 58, 97, 93, 23, 84];
    print "unsorted: [";
    for e in list { print "{e}, "; }
    println "\b\b]";
    pancake_sort((int*)list, list.len);
    print "sorted  : [";
    for e in list { print "{e}, "; }
    println "\b\b]";
}
```

**Output:**

```
unsorted: [31, 41, 59, 26, 53, 58, 97, 93, 23, 84] 
sorted  : [23, 26, 31, 41, 53, 58, 59, 84, 93, 97]
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Sorting algorithms/Pancake sort**](https://rosettacode.org/wiki/Sorting_algorithms/Pancake_sort) in Zen C.

*This article uses material from the Rosetta Code article **Sorting algorithms/Pancake sort**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Sorting_algorithms/Pancake_sort?action=history).*
