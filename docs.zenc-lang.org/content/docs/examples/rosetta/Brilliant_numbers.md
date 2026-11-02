+++
title = "Brilliant numbers"
+++

# Brilliant numbers



```zc
import "std/math.zc"
import "std/vec.zc"
import "std/sort.zc"
import "locale.h"

fn prime_sieve(n: int) -> Vec<int> {
    let primes = Vec<int>::new();
    if n < 2 { return primes; }
    primes << 2;
    if n == 2 { return primes; }
    let k = (n - 3) / 2 + 1;
    autofree let marked = (bool*)malloc(k * sizeof(bool));
    for i in 0..k { marked[i] = true; }
    let limit = ((int)Math::sqrt((f64)n) - 3) / 2 + 1;
    if limit < 0 { limit = 0; }
    for i in 0..limit {
        if marked[i] {
            let p = 2 * i + 3;
            let s = (p * p - 3) / 2;
            while s < k {
                marked[s] = false;
                s += p;
            }
        }
    }
    for i in 0..k {
        if marked[i] { primes << (2 * i + 3); }
    }
    return primes;
}

let all_primes: Vec<int>;

def MAX_U64 = 18_446_744_073_709_551_615;

fn get_brilliant(digits: int, limit: u64, count_only: bool) -> Vec<u64> {
    let brilliant = Vec<u64>::new();
    let count: u64 = 0;
    let pow: u64 = 1;
    let next: u64 = MAX_U64;
    let start_ix = 0;
    for _ in 1..=digits {
        let s = Vec<u64>::new();
        let len = all_primes.length();
        for let i = start_ix; i < len; ++i {
            if all_primes[i] > pow * 10 {
                start_ix = i;
                break;
            }
            s << all_primes[i];
        }
        for i in 0..s.length() {
            for j in i..s.length() {
                let prod: u64 = s[i] * s[j];
                if prod < limit {
                    if count_only {
                        count++;
                    } else {
                        brilliant << prod;
                    }
                } else {
                    if prod < next { next = prod; }
                    break;
                }
            }
        }
        pow *= 10;
    }
    if count_only {
        brilliant << count;
        brilliant << next;
    }
    return brilliant;
}

fn ord(n: u64, ch: char[3]) {
    let m = n % 100;
    if m >= 4 && m <= 20 {
        strcpy(ch, "th");
        return;
    }
    m %= 10;
    let s: string;
    match (m) {
        1 => { s = "st"; }
        2 => { s = "nd"; }
        3 => { s = "rd"; }
        _ => { s = "th"; }
    }
    strcpy(ch, s);
}

fn main() {
    all_primes = prime_sieve(99_999_999);
    println "First 100 brilliant numbers:";
    let brilliant = get_brilliant(2, 10000, false);
    sort_long(brilliant.data, brilliant.len);
    for i in 0..100 {
        print "{brilliant[i]:4lu} ";
        if !((i + 1) % 10) { println ""; }
    }
    println "";
    setlocale(LC_NUMERIC, "");
    let limit: u64 = 1
    let ch: [char; 3];
    for k in 1..=13 {
        limit *= 10;
        let res = get_brilliant(k, limit, true);
        let count = res[0] + 1;
        let next = res[1];
        ord(count, ch);
        println "First >= {limit:'18lu} is {count:'14lu}{ch} in the series: {next:'18lu}";
    }
    all_primes.free();
}
```

**Output:**

```
First 100 brilliant numbers:
   4    6    9   10   14   15   21   25   35   49 
 121  143  169  187  209  221  247  253  289  299 
 319  323  341  361  377  391  403  407  437  451 
 473  481  493  517  527  529  533  551  559  583 
 589  611  629  649  667  671  689  697  703  713 
 731  737  767  779  781  793  799  803  817  841 
 851  869  871  893  899  901  913  923  943  949 
 961  979  989 1003 1007 1027 1037 1067 1073 1079 
1081 1121 1139 1147 1157 1159 1189 1207 1219 1241 
1247 1261 1271 1273 1333 1343 1349 1357 1363 1369 

First >=                 10 is              4th in the series:                 10
First >=                100 is             11th in the series:                121
First >=              1,000 is             74th in the series:              1,003
First >=             10,000 is            242nd in the series:             10,201
First >=            100,000 is          2,505th in the series:            100,013
First >=          1,000,000 is         10,538th in the series:          1,018,081
First >=         10,000,000 is        124,364th in the series:         10,000,043
First >=        100,000,000 is        573,929th in the series:        100,140,049
First >=      1,000,000,000 is      7,407,841st in the series:      1,000,000,081
First >=     10,000,000,000 is     35,547,995th in the series:     10,000,600,009
First >=    100,000,000,000 is    491,316,167th in the series:    100,000,000,147
First >=  1,000,000,000,000 is  2,409,600,866th in the series:  1,000,006,000,009
First >= 10,000,000,000,000 is 34,896,253,010th in the series: 10,000,000,000,073
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Brilliant numbers**](https://rosettacode.org/wiki/Brilliant_numbers) in Zen C.

*This article uses material from the Rosetta Code article **Brilliant numbers**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Brilliant_numbers?action=history).*
