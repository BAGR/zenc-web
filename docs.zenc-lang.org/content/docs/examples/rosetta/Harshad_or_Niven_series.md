+++
title = "Harshad or Niven series"
+++

# Harshad or Niven series

```zc
fn digit_sum(n: int) -> int {
    let sum = 0;
    while n > 0 {
        sum += n % 10;
        n /= 10;
    }
    return sum;
}

fn niven(number: int, minimum: int) {
    println "First {number} Harshad or Niven numbers >= {minimum}:";
    let count = 0;
    for let n = minimum; count < number; ++n {
        if !(n % digit_sum(n)) {
            print "{n} ";
            count++;
        }
    }
    println "";
}

fn main() {
    niven(20, 1);
    println "";
    niven(1, 1001);
}
```

**Output:**

```
First 20 Harshad or Niven numbers >= 1:
1 2 3 4 5 6 7 8 9 10 12 18 20 21 24 27 30 36 40 42 

First 1 Harshad or Niven numbers >= 1001:
1002
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Harshad or Niven series**](https://rosettacode.org/wiki/Harshad_or_Niven_series) in Zen C.

*This article uses material from the Rosetta Code article **Harshad or Niven series**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Harshad_or_Niven_series?action=history).*
