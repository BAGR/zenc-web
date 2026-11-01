+++
title = "Shift list elements to left by 3"
+++

# Shift list elements to left by 3

```zc
fn lshift(a: int*, n: const usize) {
    if n < 3 { return; }
    let first = a[0];
    for i in 0..n-1 { a[i] = a[i + 1]; }
    a[n - 1] = first;
}

fn main() {
    let a = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    print "Unshifted      : [";
    for i in 0..a.len { print "{a[i]}, " }
    println "\b\b]";
    for _ in 1..4 { lshift(a, a.len); }
    print "Shift left by 3: [";
    for i in 0..a.len { print "{a[i]}, " }
    println "\b\b]";
}
```

**Output:**

```
Unshifted      : [1, 2, 3, 4, 5, 6, 7, 8, 9] 
Shift left by 3: [4, 5, 6, 7, 8, 9, 1, 2, 3]
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Shift list elements to left by 3**](https://rosettacode.org/wiki/Shift_list_elements_to_left_by_3) in Zen C.

*This article uses material from the Rosetta Code article **Shift list elements to left by 3**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Shift_list_elements_to_left_by_3?action=history).*
