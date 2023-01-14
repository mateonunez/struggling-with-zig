const expect = @import("std").testing.expect;

test "namespaced container level variables" {
    try expect(foo() == 1235);
    try expect(foo() == 1236);
}

/// Global variables may be declared inside a `struct`, `union` or `enum`.
const S = struct {
    var x: i32 = 1234;
};

fn foo() i32 {
    S.x += 1;
    return S.x;
}
