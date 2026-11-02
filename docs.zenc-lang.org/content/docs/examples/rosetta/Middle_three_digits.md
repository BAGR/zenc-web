+++
title = "Middle three digits"
+++

# Middle three digits



```zc
fn middle3(n: int) {
    let nn = n >= 0 ? n : -n;
    let s = "{nn}";
    let c = strlen(s);
    print "{n:9d} -> ";
    if c < 3 {
        println "Minimum is 3 digits, only has {c}.";
    } else if !(c % 2) {
        println "Number of digits must be odd, {c} is even.";
    } else if c == 3 {
        println "{s}";
    } else {
        let d = (c - 3) / 2;
        s[d + 3] = '\0';
        println "{s + d}";
   }
}

fn main() {
    let a = [123, 12345, 1234567, 987654321, 10001, -10001, -123, -100, 100, -12345, 1, 2, -1, -10, 2002, -2002, 0];
    for n in a { middle3(n); }
}
```

**Output:**

```
123 -> 123
    12345 -> 234
  1234567 -> 345
987654321 -> 654
    10001 -> 000
   -10001 -> 000
     -123 -> 123
     -100 -> 100
      100 -> 100
   -12345 -> 234
        1 -> Minimum is 3 digits, only has 1.
        2 -> Minimum is 3 digits, only has 1.
       -1 -> Minimum is 3 digits, only has 1.
      -10 -> Minimum is 3 digits, only has 2.
     2002 -> Number of digits must be odd, 4 is even.
    -2002 -> Number of digits must be odd, 4 is even.
        0 -> Minimum is 3 digits, only has 1.
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Middle three digits**](https://rosettacode.org/wiki/Middle_three_digits) in Zen C.

*This article uses material from the Rosetta Code article **Middle three digits**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Middle_three_digits?action=history).*
