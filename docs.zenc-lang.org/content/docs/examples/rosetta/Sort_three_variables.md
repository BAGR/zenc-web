+++
title = "Sort three variables"
+++

# Sort three variables

As the std/sort module does not currently have a function for sorting strings, we use the standard C function, qsort, for this part of the task.

```zc
import "std/sort.zc"

fn string_comparer(a: const void*, b: const void*) -> int {
    return strcmp(*(char**)a, *(char**)b);
}

fn main() {
    let x = "lions, tigers, and";
    let y = "bears, oh my!";
    let z = "(from the \"Wizard of OZ\")";
    let arr = [x, y, z];
    qsort(arr, 3, sizeof(const char*), string_comparer);
    x = arr[0];
    y = arr[1];
    z = arr[2];
    println "After sorting strings:";
    println "  x = {x}";
    println "  y = {y}";
    println "  z = {z}";

    let i = 77444;
    let j = -12;
    let k = 0;
    let arr2 = [i, j, k];
    sort_int((int*)arr2, 3);
    i = arr2[0];
    j = arr2[1];
    k = arr2[2];
    println "\nAfter sorting integers:";
    println "  i = {i}";
    println "  j = {j}";
    println "  k = {k}";

    let f: f32 = 11.3;
    let g: f32 = -9.7;
    let h: f32 = 11.17;
    let arr3 = [f, g, h];
    sort_float((f32*)arr3, 3);
    f = arr3[0];
    g = arr3[1];
    h = arr3[2];
    println "\nAfter sorting floats:";
    println "  f = {f:g}";
    println "  g = {g:g}";
    println "  h = {h:g}";
}
```

**Output:**

```
After sorting strings:
  x = (from the "Wizard of OZ")
  y = bears, oh my!
  z = lions, tigers, and

After sorting integers:
  i = -12
  j = 0
  k = 77444

After sorting floats:
  f = -9.7
  g = 11.17
  h = 11.3
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Sort three variables**](https://rosettacode.org/wiki/Sort_three_variables) in Zen C.

*This article uses material from the Rosetta Code article **Sort three variables**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Sort_three_variables?action=history).*
