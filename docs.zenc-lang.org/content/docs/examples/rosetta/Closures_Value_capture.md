+++
title = "Closures/Value capture"
+++

# Closures/Value capture

```zc
alias clos = fn() -> int;

fn main() {
    let fs: [clos; 10];
    for i in 0..10 {
        fs[i] = fn() -> int { return i * i; }
    }
    for i in 0..9 {
        println "Function {i} : {fs[i]()}";
    }
}
```

**Output:**

```
Function 0 : 0
Function 1 : 1
Function 2 : 4
Function 3 : 9
Function 4 : 16
Function 5 : 25
Function 6 : 36
Function 7 : 49
Function 8 : 64
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Closures/Value capture**](https://rosettacode.org/wiki/Closures/Value_capture) in Zen C.

*This article uses material from the Rosetta Code article **Closures/Value capture**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Closures/Value_capture?action=history).*
