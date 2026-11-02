+++
title = "Strange numbers"
+++

# Strange numbers



### Basic task

```zc
import "std/vec.zc"

fn is_prime(i: int) -> bool {
    return i == 2 || i == 3 || i == 5 || i == 7;
}

impl int {
    fn abs(self) -> int { return *self >= 0 ? *self : -(*self); }
}

fn main() {
    let count = 0;
    let d = Vec<int>::new();
    println "Strange numbers in the open interval (100, 500) are:\n";
    for i in 101..500 {
        d.clear();
        let j = i;
        while j > 0 {
            d << (j % 10);
            j /= 10;
        }
        if is_prime((d[0] - d[1]).abs()) && is_prime((d[1] - d[2]).abs()) {
            print "{i} ";
            if !(++count % 10) { println ""; }
        }
    }
    if count % 10 { println ""; }
    println "\n{count} strange numbers in all.";
}
```

**Output:**

```
Strange numbers in the open interval (100, 500) are:

130 131 135 136 138 141 142 146 147 149 
161 163 164 168 169 181 183 185 186 202 
203 205 207 241 242 246 247 249 250 252 
253 257 258 270 272 274 275 279 292 294 
296 297 302 303 305 307 313 314 316 318 
350 352 353 357 358 361 363 364 368 369 
381 383 385 386 413 414 416 418 420 424 
425 427 429 461 463 464 468 469 470 472 
474 475 479 492 494 496 497 

87 strange numbers in all.
```

### Stretch goal

```zc
import "std/vec.zc"
import "locale.h"

let diffs: const int[8] = [-7, -5, -3, -2, 2, 3, 5, 7];
let possibles: [Vec<int>; 10];

fn main() {
    for i in 0..10 {
        possibles[i] = Vec<int>::new();
        for d in diffs {
            let sum = i + d;
            if sum >= 0 && sum < 10 { possibles[i] << sum; }
        }
    }
    let places = 10;
    let start = 1;
    let strange_ones = Vec<int>::new();
    strange_ones << start;
    for i in 2..=places {
        let new_ones = Vec<int>::new();
        for n in strange_ones {
            for next_n in possibles[n % 10] { new_ones << (n * 10 + next_n); }
        }
        strange_ones.free();
        strange_ones = new_ones;
    }
    setlocale(LC_NUMERIC, "");
    println "Found {strange_ones.length():'lu} {places}-digit strange numbers beginning with {start}.";
    for i in 0..10 { possibles[i].free(); }
}
```

**Output:**

```
Found 853,423 10-digit strange numbers beginning with 1.
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Strange numbers**](https://rosettacode.org/wiki/Strange_numbers) in Zen C.

*This article uses material from the Rosetta Code article **Strange numbers**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Strange_numbers?action=history).*
