+++
title = "Vampire number"
+++

# Vampire number



```zc
import "std/vec.zc"
import "std/math.zc"

fn max(a: u64, b: u64) -> u64 {
    if a > b { return a; }
    return b;
}

fn min(a: u64, b: u64) -> u64 {
    if a < b { return a; }
    return b;
}

fn ndigits(x: u64) -> int {
    let n = 0 ;
    for ; x > 0; x /= 10 { n++; }
    return n;
}

fn dtally(x: u64) -> u64 {
    let t: u64 = 0;
    for ; x > 0; x /= 10 {
        t += 1 << ((x % 10) * 6);
    }
    return t;
}

let tens: [u64; 20];

fn init() {
    tens[0] = 1;
    for i in 1..20 { tens[i] = tens[i - 1] * 10; }
}

fn fangs(x: u64) -> Vec<u64> {
    let f = Vec<u64>::new();
    let nd = ndigits(x);
    if nd % 2 { return f; }
    nd /= 2;
    let lo = max(tens[nd - 1], (x + tens[nd] - 2) / (tens[nd] - 1));
    let hi = min(x / lo, (u64)Math::sqrt((f64)x));
    let t = dtally(x);
    for let a = lo; a <= hi; ++a {
        let b = x / a;
        if a * b == x &&
           (a % 10 > 0 || b % 10 > 0) &&
           t == dtally(a) + dtally(b) { f << a; }
    }
    return f;
}

fn show_fangs(x: u64, f: Vec<u64>*) {
    print "{x}";
    if f.length() > 1 { println ""; }
    for a in *f {
        println " = {a} x {x / a}";
    }
}

fn main() {
    init();
    let n = 0;
    for let x: u64 = 1; n < 26; ++x {
        let f = fangs(x);
        if f.length() > 0 {
            n++;
            print "{n:2d}: ";
            show_fangs(x, &f);
        }
    }
    println "";
    let nums: u64[3] = [16758243290880, 24959017348650, 14593825548650];
    for x in nums {
        let f = fangs(x);
        if f.length() > 0 {
            show_fangs(x, &f);
        } else {
            println "{x} is not vampiric";
        }
    }
}
```

**Output:**

```
1: 1260 = 21 x 60
 2: 1395 = 15 x 93
 3: 1435 = 35 x 41
 4: 1530 = 30 x 51
 5: 1827 = 21 x 87
 6: 2187 = 27 x 81
 7: 6880 = 80 x 86
 8: 102510 = 201 x 510
 9: 104260 = 260 x 401
10: 105210 = 210 x 501
11: 105264 = 204 x 516
12: 105750 = 150 x 705
13: 108135 = 135 x 801
14: 110758 = 158 x 701
15: 115672 = 152 x 761
16: 116725 = 161 x 725
17: 117067 = 167 x 701
18: 118440 = 141 x 840
19: 120600 = 201 x 600
20: 123354 = 231 x 534
21: 124483 = 281 x 443
22: 125248 = 152 x 824
23: 125433 = 231 x 543
24: 125460
 = 204 x 615
 = 246 x 510
25: 125500 = 251 x 500
26: 126027 = 201 x 627

16758243290880
 = 1982736 x 8452080
 = 2123856 x 7890480
 = 2751840 x 6089832
 = 2817360 x 5948208
24959017348650
 = 2947050 x 8469153
 = 2949705 x 8461530
 = 4125870 x 6049395
 = 4129587 x 6043950
 = 4230765 x 5899410
14593825548650 is not vampiric
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Vampire number**](https://rosettacode.org/wiki/Vampire_number) in Zen C.

*This article uses material from the Rosetta Code article **Vampire number**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Vampire_number?action=history).*
