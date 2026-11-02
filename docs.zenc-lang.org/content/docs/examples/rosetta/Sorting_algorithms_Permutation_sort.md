+++
title = "Sorting algorithms/Permutation sort"
+++

# Sorting algorithms/Permutation sort



```zc
fn is_sorted(a: int*, len: usize) -> bool {
    for i in 1..len {
        if a[i] < a[i - 1] { return false; }
    }
    return true;
}

fn recurse(a: int*, len: const usize, last: int) -> bool {
    if last <= 0 { return is_sorted(a, len); }
    for i in 0..=last {
        let t = a[i];
        a[i] = a[last];
        a[last] = t;
        if recurse(a, len, last - 1) { return true; }
        t = a[i];
        a[i] = a[last];
        a[last] = t;
    }
    return false;
}

fn main() {
    let a = [170, 45, 75, -90, -802, 24, 2, 66];
    print "Unsorted: [";
    for e in a { print "{e}, "; }
    println "\b\b]";
    let count = a.len;
    if count > 1 && !recurse(a, count, count - 1) {
        eprintln "Sorted permutation not found!";
    } else {
        print "Sorted  : [";
        for e in a { print "{e}, "; }
        println "\b\b]";
    }
}
```

**Output:**

```
Unsorted: [170, 45, 75, -90, -802, 24, 2, 66] 
Sorted  : [-802, -90, 2, 24, 45, 66, 75, 170]
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Sorting algorithms/Permutation sort**](https://rosettacode.org/wiki/Sorting_algorithms/Permutation_sort) in Zen C.

*This article uses material from the Rosetta Code article **Sorting algorithms/Permutation sort**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Sorting_algorithms/Permutation_sort?action=history).*
