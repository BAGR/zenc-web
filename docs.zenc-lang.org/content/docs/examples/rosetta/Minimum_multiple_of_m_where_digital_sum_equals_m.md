+++
title = "Minimum multiple of m where digital sum equals m"
+++

# Minimum multiple of m where digital sum equals m

```zc
import "locale.h"

fn digits_sum(n: int) -> int {
    let sum = 0;
    while n > 0 {
        sum += n % 10;
        n /= 10;
    }
    return sum;
}

fn main() {
    setlocale(LC_NUMERIC, "");
    for n in 1..=70 {
        let m = 1;
        while digits_sum(m * n) != n { m++; }
        print "{m:'10d} ";
        if !(n % 10) { println ""; }
    }
}
```

**Output:**

```
1          1          1          1          1          1          1          1          1         19 
        19          4         19         19         13         28         28         11         46        199 
        19        109         73         37        199         73         37        271        172      1,333 
       289        559      1,303        847      1,657        833      1,027      1,576      1,282     17,497 
     4,339      2,119      2,323     10,909     11,111     12,826     14,617     14,581     16,102    199,999 
    17,449     38,269     56,413     37,037  1,108,909    142,498    103,507    154,981    150,661  1,333,333 
   163,918    322,579    315,873    937,342  1,076,923  1,030,303    880,597  1,469,116  1,157,971 12,842,857
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Minimum multiple of m where digital sum equals m**](https://rosettacode.org/wiki/Minimum_multiple_of_m_where_digital_sum_equals_m) in Zen C.

*This article uses material from the Rosetta Code article **Minimum multiple of m where digital sum equals m**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Minimum_multiple_of_m_where_digital_sum_equals_m?action=history).*
