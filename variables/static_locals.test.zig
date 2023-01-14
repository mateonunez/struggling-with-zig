const expect = @import("std").testing.expect;

test "static local variable" {
    try expect(foo() == 1);
    try expect(foo() == 2);
}

fn foo() i32 {
    const S = struct {
        var a: i32 = 0;
    };
    S.a += 1;
    return S.a;
}
