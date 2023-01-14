const expect = @import("std").testing.expect;

test "comptime vars" {
    var x: i32 = 0;
    comptime var y: i32 = 0;

    x += 1;
    y += 1;

    try expect(x == 1);
    try expect(y == 1);

    if (y != 1) {
        // This compile error never triggers because y is a comptime.
        // and so `y != 1` is a comptime value, and this if is statically
        // evaluated.
        @compileError("y is not 1");
    }
}
