+++
title = "Range expansion"
+++

# Range expansion



```zc
import "std/vec.zc"
import "std/string.zc"

fn expand_range(str: string) -> Vec<int> {
    let list = Vec<int>::new();
    let s = String::from(str);
    let items = s.split(',');
    for item in items {
        let count = 0;
        let cs = item.c_str();
        for i in 0..strlen(cs) { if cs[i] == '-' { count++; } }
        if count == 0 || ( count == 1 && cs[0] == '-') {
            list << atoi(cs);
        } else {
            let items2 = item.split('-'); 
            let first: int;
            let last:  int;
            if count == 1 {
                let s1 = items2.get(0).c_str();
                let s2 = items2.get(1).c_str();
                first  = atoi(s1);
                last   = atoi(s2);
            } else if count == 2 {
                let s1 = items2.get(1).c_str();
                let s2 = items2.get(2).c_str();
                first  = atoi(s1) * -1;
                last   = atoi(s2);
            } else {
                let s1 = items2.get(1).c_str();
                let s2 = items2.get(3).c_str();
                first  = atoi(s1) * -1;
                last   = atoi(s2) * -1;
            }
            for i in first..=last { list << i; }
            for i in 0..items2.length() { items2.get(i).free(); }
        }
    }
    return list;
}

fn main() {
    let s = "-6,-3--1,3-5,7-11,14,15,17-20";
    let list = expand_range(s);
    print "[";
    for v in list { print "{v}, "; }
    println "\b\b]";
}
```

**Output:**

```
[-6, -3, -2, -1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Range expansion**](https://rosettacode.org/wiki/Range_expansion) in Zen C.

*This article uses material from the Rosetta Code article **Range expansion**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Range_expansion?action=history).*
