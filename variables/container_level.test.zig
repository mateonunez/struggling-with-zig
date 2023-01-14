/// Global variables are considered to be
/// a top level declaration. The y are independent and lazily analyzed.
/// If a global variable is `const` then its values is `comptime-known`,
/// otherwise it is `runtime-known`.
var y: i32 = add(1, x);
const x: i32 = add(3, 4);

const expect = @import("std").testing.expect;

fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "add" {
    try expect(x == 7);
    try expect(y == 8);
}
