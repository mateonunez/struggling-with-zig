const expect = @import("std").testing.expect;
const print = @import("std").debug.print;

const x = 1234;

fn cannot_assign() !void {
    const z: i16 = 5678;
    // z += 1; // error: cannot assign to constant
    try expect(z == 5678);
}

fn can_assign() !void {
    var z: i16 = 5678;
    z += 1;
    try expect(z == 5679);
}

/// This is not allowed because the compiler cannot prove that z is initialized
// fn cannot_initialize() !void {
//     var z: i16;
//     z = 5678;
//     try expect(z == 5678);
// }

/// Instead of that, use `undefined` as default value
fn can_initialize() !void {
    var z: i16 = undefined;
    z = 5678;
    try expect(z == 5678);
}

test "assignment" {
    cannot_assign() catch unreachable;
    can_assign() catch unreachable;
    // cannot_initialize() catch unreachable;
    can_initialize() catch unreachable;
}
