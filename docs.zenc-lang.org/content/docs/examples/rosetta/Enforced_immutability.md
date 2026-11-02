+++
title = "Enforced immutability"
+++

# Enforced immutability

Zen C has both compile time and run time constants.

The former (declared with the 'def' keyword) are simply folded into the code at compile time.

The latter (declared by preceding the type with the 'const' keyword) are, in effect, read-only runtime variables or function parameters. It is a compiler error to try to modify their initial value.

```zc
def MAX = 5; // compile time constant

fn countdown(limit: const int) {  // read-only parameter
   // limit = 10; Cannot assign to const variable 'limit'
   for i in limit..=0 step -1 { println "{i}" }
}

fn main() {
    let x: const int = 6;  // read-only variable
    // x = 10;             // error: Cannot assign to const variable 'x'
    println "{x}";
    countdown(MAX);
}
```

**Output:**

```
6
5
4
3
2
1
0
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Enforced immutability**](https://rosettacode.org/wiki/Enforced_immutability) in Zen C.

*This article uses material from the Rosetta Code article **Enforced immutability**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Enforced_immutability?action=history).*
