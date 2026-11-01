+++
title = "Show ASCII table"
+++

# Show ASCII table



```zc
fn main() {
    for i in 0..16 {
        for let j = 32 + i; j < 128; j += 16 {
            let c = "{j:c}";
            if j == 32 {
                c = "Spc";
            } else if j == 127 {
                c = "Del";
            }
            print "{j:3d} = {c:-3s}   ";
        }
        println "";
    }
}
```

**Output:**

```
32 = Spc    48 = 0      64 = @      80 = P      96 = `     112 = p     
 33 = !      49 = 1      65 = A      81 = Q      97 = a     113 = q     
 34 = "      50 = 2      66 = B      82 = R      98 = b     114 = r     
 35 = #      51 = 3      67 = C      83 = S      99 = c     115 = s     
 36 = $      52 = 4      68 = D      84 = T     100 = d     116 = t     
 37 = %      53 = 5      69 = E      85 = U     101 = e     117 = u     
 38 = &      54 = 6      70 = F      86 = V     102 = f     118 = v     
 39 = '      55 = 7      71 = G      87 = W     103 = g     119 = w     
 40 = (      56 = 8      72 = H      88 = X     104 = h     120 = x     
 41 = )      57 = 9      73 = I      89 = Y     105 = i     121 = y     
 42 = *      58 = :      74 = J      90 = Z     106 = j     122 = z     
 43 = +      59 = ;      75 = K      91 = [     107 = k     123 = {     
 44 = ,      60 = <      76 = L      92 = \     108 = l     124 = |     
 45 = -      61 = =      77 = M      93 = ]     109 = m     125 = }     
 46 = .      62 = >      78 = N      94 = ^     110 = n     126 = ~     
 47 = /      63 = ?      79 = O      95 = _     111 = o     127 = Del
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Show ASCII table**](https://rosettacode.org/wiki/Show_ASCII_table) in Zen C.

*This article uses material from the Rosetta Code article **Show ASCII table**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Show_ASCII_table?action=history).*
