+++
title = "Euler method"
+++

# Euler method



```zc
import "std/math.zc"

alias deriv = fn*(f64, f64) -> f64;

fn euler(f: deriv, y: f64, step: int, end: int) {
    let t = 0;
    print " Step {step:2d}: ";
    do {
        if !(t % 10) { print " {y:7.3f}"; }
        y += step * f(t, y);
        t += step;
    } while t <= end;
    println "";
}

fn analytic() {
    print "    Time: ";
    for let t = 0; t <= 100; t += 10 { print " {(f64)t:7g}"; }
    print "\nAnalytic: ";
    for let t = 0; t <= 100; t += 10 {
        let v = 20.0 + 80.0 * Math::exp(-0.07 * (f64)t);
        print " {v:7.3f}";
    }
    println "";
}

fn cooling(_: f64, temp: f64) -> f64 {
    return -0.07 * (temp - 20.0);
}

fn main() {
    analytic();
    euler(cooling, 100, 2, 100);
    euler(cooling, 100, 5, 100);
    euler(cooling, 100, 10, 100);
}
```

**Output:**

```
Time:        0      10      20      30      40      50      60      70      80      90     100
Analytic:  100.000  59.727  39.728  29.797  24.865  22.416  21.200  20.596  20.296  20.147  20.073
 Step  2:  100.000  57.634  37.704  28.328  23.918  21.843  20.867  20.408  20.192  20.090  20.042
 Step  5:  100.000  53.800  34.280  26.034  22.549  21.077  20.455  20.192  20.081  20.034  20.014
 Step 10:  100.000  44.000  27.200  22.160  20.648  20.194  20.058  20.017  20.005  20.002  20.000
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Euler method**](https://rosettacode.org/wiki/Euler_method) in Zen C.

*This article uses material from the Rosetta Code article **Euler method**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Euler_method?action=history).*
