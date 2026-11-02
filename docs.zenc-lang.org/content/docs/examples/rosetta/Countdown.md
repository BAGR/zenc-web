+++
title = "Countdown"
+++

# Countdown



```zc
import "std/random.zc"
import "std/vec.zc"

let rng: Random;

fn shuffle(a: int*, len: usize) {
    for let i: usize = len - 1; i >= 1; --i {
        let j = rng.next_int_range(0, (int)i);
        if j != i {
            let t = a[i];
            a[i] = a[j];
            a[j] = t;
        }
    }
}

fn countdown(numbers: Vec<int>, target: int) -> bool {
    if numbers.length() <= 1 { return false; }
    for i in 0..numbers.length() {
        let n0 = numbers.get(i);
        let numbers1 = Vec<int>::new();
        for k in 0..numbers.length() {
            if k != i { numbers1 << numbers.get(k); }
        }
        for j in 0..numbers1.length() {
            let n1 = numbers1.get(j);
            let numbers2 = Vec<int>::new();
            for k in 0..numbers1.length() {
                if k != j { numbers2 << numbers1.get(k); }
            }
            if n1 >= n0 {
                // Addition.
                let result = n1 + n0;
                let numbers_new = numbers2.clone();
                numbers_new << result;
                if result == target || countdown(numbers_new, target) {
                    println "{result} = {n1} + {n0}";
                    return true;
                }
                // Multiplication.
                if n0 != 1 {
                    result = n1 * n0;
                    let numbers_next = numbers2.clone();
                    numbers_next << result;
                    if result == target || countdown(numbers_next, target) {
                        println "{result} = {n1} * {n0}";
                        return true;
                    }
                }
                // Subtraction.
                if n1 != n0 {
                    result = n1 - n0;
                    let numbers_next = numbers2.clone();
                    numbers_next << result;
                    if result == target || countdown(numbers_next, target) {
                        println "{result} = {n1} - {n0}";
                        return true;
                    }
                }
                // Division.
                if n0 != 1  && !(n1 % n0) {
                    result = n1 / n0;
                    let numbers_next = numbers2.clone();
                    numbers_next << result;
                    if result == target || countdown(numbers_next, target) {
                        println "{result} = {n1} / {n0}";
                        return true;
                    }
                }
            }
        }
    }
    return false;
}                 

fn main() {
    rng = Random::new();
    let all_numbers = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 25, 50, 75, 100];
    shuffle(all_numbers, all_numbers.len);
    let a1 = [3, 6, 25, 50, 75, 100];
    let a2 = [100, 75, 50, 25, 6, 3]; // see if there's much difference if we reverse a1                 
    let a3 = [8, 4, 4, 6, 8, 9];
    let a4: int[6];
    for i in 0..6 { a4[i] = all_numbers[i]; }
    let aa: int*[4] = [a1, a2, a3, a4];
    let target_list = [952, 952, 594, rng.next_int_range(101, 999)];
    for i in 0..4 {
        let v = Vec<int>::new();
        print "Using : [";
        for j in 0..6 {
            print "{aa[i][j]}, ";
            v << aa[i][j];
        }
        println "\b\b]";
        println "Target: {target_list[i]}";
        let done = countdown(v, target_list[i]);
        if !done { println "No exact solution found."; }
        println "";
    }
}
```

**Output:**

Note that the fourth example is random.

```
Using : [3, 6, 25, 50, 75, 100] 
Target: 952
952 = 23800 / 25
23800 = 23850 - 50
23850 = 225 * 106
106 = 100 + 6
225 = 75 * 3

Using : [100, 75, 50, 25, 6, 3] 
Target: 952
952 = 23800 / 25
23800 = 23850 - 50
23850 = 7950 * 3
7950 = 106 * 75
106 = 100 + 6

Using : [8, 4, 4, 6, 8, 9] 
Target: 594
594 = 66 * 9
66 = 64 + 2
64 = 16 * 4
2 = 6 - 4
16 = 8 + 8

Using : [9, 4, 3, 100, 2, 25] 
Target: 243
243 = 218 + 25
218 = 436 / 2
436 = 109 * 4
109 = 100 + 9
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Countdown**](https://rosettacode.org/wiki/Countdown) in Zen C.

*This article uses material from the Rosetta Code article **Countdown**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Countdown?action=history).*
