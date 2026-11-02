+++
title = "Abstract type"
+++

# Abstract type

The position is similar to Rust in that Zen C doesn't have *classes* but does have *structs* and the latter can share behavior by implementing *traits* which are similar in concept to *abstract classes*. Expanding a little on the Rust example:

```zc
import "std/math.zc"

trait Shape {
    fn area(self) -> f64;
}

struct Square {
    side_length: f64;
}

impl Shape for Square {
    fn area(self) -> f64 {
        return self.side_length * self.side_length;
    }
}

struct Circle {
    radius: f64;
}

impl Shape for Circle {
    fn area(self) -> f64 {
        return Math::PI() * self.radius * self.radius;
    }
}

// Prints the area of any Shape.
fn print_area(shape: Shape) {
    println "{shape.area()}";
}

fn main() {
    let square = Square{side_length: 5.0};
    let circle = Circle{radius: 2.5};
    print_area(&square);
    print_area(&circle);
}
```

**Output:**

```
25.000000
19.634954
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Abstract type**](https://rosettacode.org/wiki/Abstract_type) in Zen C.

*This article uses material from the Rosetta Code article **Abstract type**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Abstract_type?action=history).*
