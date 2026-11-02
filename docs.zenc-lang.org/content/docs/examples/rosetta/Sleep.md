+++
title = "Sleep"
+++

# Sleep

```zc
import "std/thread.zc"
import "std/io.zc"

fn main() {
    print "Enter number of milliseconds to sleep: ";
    autofree let input = readln();
    let ms = atoi(input);
    println "Sleeping...";
    sleep_ms(ms);
    println "Awake!";
}
```

**Output:**

Sample run:

```
Enter number of milliseconds to sleep: 5000 
Sleeping...
Awake!
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Sleep**](https://rosettacode.org/wiki/Sleep) in Zen C.

*This article uses material from the Rosetta Code article **Sleep**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Sleep?action=history).*
