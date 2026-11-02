+++
title = "Greatest subsequential sum"
+++

# Greatest subsequential sum


Note that Zen C does not support empty arrays so instead we process an array with a single element.

```zc
fn gss(s: int*, n: const usize) -> (int, int, int) {
    let best = 0;
    let start = 0;
    let end = 0;
    let sum = 0;
    let sum_start = 0;
    for let i = 0; i < n; ++i {
        sum += s[i];
        if sum > best {
            best = sum;
            start = sum_start;
            end = i + 1;
        } else if sum < 0 {
            sum = 0;
            sum_start = i + 1;
        }
    }
    return (start, end, best);
}

fn main() {
    let t1 = [-1, -2, 3, 5, 6, -2, -1, 4, -4, 2, -1];
    let t2 = [-1, 1, 2, -5, -6];
    let t3 = [-1];
    let t4 = [-1, -2, -1];
    let ts: int*[4] = [t1, t2, t3, t4];
    let lens = [11, 5, 1, 3];
    for i in 0..4 {
        let tt = ts[i];
        print "Input:   [";
        for j in 0..lens[i] { print "{tt[j]}, "; }
        println "\b\b]";
        let res = gss((int*)tt, lens[i]);
        let (start, end, best) = res;
        print "Sub seq: [";
        if start < end {
            for j in start..end { print "{tt[j]}, "; }
            println "\b\b]";
        } else {
            println "]";
        }
        println "Sum:     {best}\n";
    }
}
```

**Output:**

```
Input:   [-1, -2, 3, 5, 6, -2, -1, 4, -4, 2, -1] 
Sub seq: [3, 5, 6, -2, -1, 4] 
Sum:     15

Input:   [-1, 1, 2, -5, -6] 
Sub seq: [1, 2] 
Sum:     3

Input:   [-1] 
Sub seq: []
Sum:     0

Input:   [-1, -2, -1] 
Sub seq: []
Sum:     0
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Greatest subsequential sum**](https://rosettacode.org/wiki/Greatest_subsequential_sum) in Zen C.

*This article uses material from the Rosetta Code article **Greatest subsequential sum**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Greatest_subsequential_sum?action=history).*
