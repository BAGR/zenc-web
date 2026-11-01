+++
title = "Special variables"
+++

# Special variables

Zen-C has two special variables, self and Self, which are used in object oriented programming.

The first of these represents a pointer to the current instance and the second represents the instance's type. The latter is typically used as the return type of a constructor.

Note that when invoking a field or method via a pointer, the pointer is automatically de-referenced and so the 'crow's foot' operator (->) is not needed with 'self'.

Zen-C also regards variables consisting of one or more underscores as special. They are used as placeholders for variables which are required syntactically but are never actually used and may prevent the compiler from issuing a 'variable not used' warning.

```zc
struct Person {
    name: string;
    age: int;
}

impl Person {
    // Constructor.
    fn new(name: string, age: int) -> Self {
        return Person{ name: name, age: age };
    }

    // Instance method.
    fn change_name(self, new_name: string) {
        self.name = new_name;
    }

    // Instance method which is automatically called by string interpolation.
    fn to_string(self) -> string {
        return "Person: name = {self.name}, age = {self.age}";
    }
}

fn main() {
    let p = Person::new("fred", 40);
    println "{p}";
    p.change_name("george");
    println "{p}\n";

    // Prints Hello 3 times without requiring a 'normal' control variable.
    for _ in 0..3 {
        println "Hello";
    }
}
```

**Output:**

```
Person: name = fred, age = 40
Person: name = george, age = 40

Hello
Hello
Hello
```

---
**Attribution:** This is a community solution for the Rosetta Code task [**Special variables**](https://rosettacode.org/wiki/Special_variables) in Zen C.

*This article uses material from the Rosetta Code article **Special variables**, which is released under the [GNU Free Documentation License 1.3](https://www.gnu.org/licenses/fdl-1.3.html). A list of the original authors can be found in the [page history](https://rosettacode.org/wiki/Special_variables?action=history).*
