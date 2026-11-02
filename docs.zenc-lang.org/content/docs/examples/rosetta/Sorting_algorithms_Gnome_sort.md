+++
title = "Sorting algorithms/Gnome sort"
+++

# Sorting algorithms/Gnome sort

```zc
fn gnome_sort(a: int*, size: const usize, asc: bool) {
    let i = 1;
    let j = 2;
    while i < size {
        if (asc && a[i - 1] <= a[i]) || (!asc && a[i - 1] >= a[i]) {
            i = j;
            j++;
        } else {
            let t = a[i - 1];
            a[i - 1] = a[i];
            a[i] = t;
            if !(--i) {
                i = j;
                j++;
            }
        }
    }
}

fn main() {
    let a1 = [4, 65, 2, -31, 0, 99, 2, 83, 782, 1];
    let a2 = [7, 5, 2, 6, 1, 4, 2, 6, 3];
    let aa: int*[2] = [a1, a2];
    let lens = [a1.len, a2.len];
    let ba: bool[2] = [true, false];
    for asc in ba {
        let dir = asc ? "ascending" : "descending";
        println "Sorting in {dir} order:\n";
        for i in 0..aa.len {
            print "  Before: [";
            for j in 0..lens[i] { print "{aa[i][j]}, "; }
            println "\b\b]";
            gnome_sort(aa[i], lens[i], asc);
            print "  After : [";
            for j in 0..lens[i] { print "{aa[i][j]}, "; }
            println "\b\b]\n";
        }
    }
}
```

**Output:**

```
Sorting in ascending order:

  Before: [4, 65, 2, -31, 0, 99, 2, 83, 782, 1] 
  After : [-31, 0, 1, 2, 2, 4, 65, 83, 99, 782] 

  Before: [7, 5, 2, 6, 1, 4, 2, 6, 3] 
  After : [1, 2, 2, 3, 4, 5, 6, 6, 7] 

Sorting in descending order:

  Before: [-31, 0, 1, 2, 2, 4, 65, 83, 99, 782] 
  After : [782, 99, 83, 65, 4, 2, 2, 1, 0, -31] 

  Before: [1, 2, 2, 3, 4, 5, 6, 6, 7] 
  After : [7, 6, 6, 5, 4, 3, 2, 2, 1]
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Sorting algorithms/Gnome sort**](https://rosettacode.org/wiki/Sorting_algorithms/Gnome_sort) in Zen C.

*This article uses material from the Rosetta Code article **Sorting algorithms/Gnome sort**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Sorting_algorithms/Gnome_sort?action=history).*
