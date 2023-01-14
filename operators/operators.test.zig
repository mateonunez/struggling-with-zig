const expect = @import("std").testing.expect;

test "addition" {
    // Simple addition
    {
        var a: i32 = 1;
        const b: i32 = 2;
        try expect(a + b == 3);
        a += b;
        try expect(a == 3);
    }

    // Wrapping addition
    // Guaranteed to have two-complement wrapping behavior
    // Invokes Peer Type Resolution for the operands
    {
        var a: i32 = 1;
        const b: i32 = 2;
        try expect(a +% b == 3);
        a +%= b;
        try expect(a == 3);
    }

    // Saturating Addition
    // Invokes Peer Type Resolution for the operands.
    {
        var a: i32 = 1;
        const b: i32 = 2;
        try expect(a +| b == 3);
        a +|= b;
        try expect(a == 3);
    }
}

test "substraction" {
    // Simple substraction
    {
        var a: i32 = 3;
        const b: i32 = 2;
        try expect(a - b == 1);
        a -= b;
        try expect(a == 1);
    }

    // Wrapping substraction
    // Guaranteed to have two-complement wrapping behavior
    // Invokes Peer Type Resolution for the operands
    {
        var a: i32 = 3;
        const b: i32 = 2;
        try expect(a -% b == 1);
        a -%= b;
        try expect(a == 1);
    }

    // Saturating Substraction
    // Invokes Peer Type Resolution for the operands.
    {
        var a: i32 = 3;
        const b: i32 = 2;
        try expect(a -| b == 1);
        a -|= b;
        try expect(a == 1);
    }
}

test "multiplication" {
    // Simple multiplication
    {
        var a: i32 = 2;
        const b: i32 = 3;
        try expect(a * b == 6);
        a *= b;
        try expect(a == 6);
    }

    // Wrapping multiplication
    // Guaranteed to have two-complement wrapping behavior
    // Invokes Peer Type Resolution for the operands
    {
        var a: i32 = 2;
        const b: i32 = 3;
        try expect(a *% b == 6);
        a *%= b;
        try expect(a == 6);
    }

    // Saturating Multiplication
    // Invokes Peer Type Resolution for the operands.
    {
        var a: i32 = 2;
        const b: i32 = 3;
        try expect(a *| b == 6);
        a *|= b;
        try expect(a == 6);
    }
}

test "division" {
    // Simple division
    // Can cause integer overflow
    // Can cause division by zero
    // Signed integer operands must be comptime-known and positive.
    // Invokes Peer Type Resolution for the operands.
    {
        var a: i32 = 6;
        const b: i32 = 3;
        try expect(@divExact(a, b) == 2);
        a = @divExact(a, b);
        try expect(a == 2);
    }

    // Remainder division
    {
        var a: i32 = 6;
        const b: i32 = 4;
        try expect(@rem(a, b) == 2);
        a = @rem(a, b);
        try expect(a == 2);
    }
}

test "negation" {
    // Simple negation
    {
        var a: i32 = 1;
        try expect(-a == -1);
    }

    // Wrapping negation
    // Guaranteed to have two-complement wrapping behavior
    {
        var a: i32 = 1;
        const b: i32 = 2;
        try expect(-%a == -1);
        a -%= b;
        try expect(a == -1);
    }
}

test "bit shift" {
    // Left shift
    {
        var a: i32 = 1;
        const b: i32 = 2;
        try expect(a << b == 4);
        a <<= b;
        try expect(a == 4);
    }

    // Saturating Left shift
    {
        var a: i32 = 1;
        const b: i32 = 2;
        try expect(a <<| b == 4);
        a <<|= b;
        try expect(a == 4);
    }

    // Right shift
    {
        var a: i32 = 4;
        const b: i32 = 2;
        try expect(a >> b == 1);
        a >>= b;
        try expect(a == 1);
    }
}

test "bitwise" {
    // Bitwise AND
    {
        var a: i32 = 0b1010;
        const b: i32 = 0b1100;
        try expect(a & b == 0b1000);
        a &= b;
        try expect(a == 0b1000);
    }

    // Bitwise OR
    {
        var a: i32 = 0b1010;
        const b: i32 = 0b1100;
        try expect(a | b == 0b1110);
        a |= b;
        try expect(a == 0b1110);
    }

    // Bitwise XOR
    {
        var a: i32 = 0b1010;
        const b: i32 = 0b1100;
        try expect(a ^ b == 0b0110);
        a ^= b;
        try expect(a == 0b0110);
    }

    // Bitwise NOT
    {
        var a: i32 = 0b1010;
        try expect(~a == -0b1011);
    }
}

test "conditionals | optionals" {
    // if `a` is null returns b, otherwise returns
    // the unwrapper value of a.
    {
        const value: ?u32 = null;
        const unwrapped = value orelse 1234;
        try expect(unwrapped == 1234);
    }

    // This is equivalent to: `a orelse unreachable`
    {
        const value: ?u32 = 1234;
        try expect(value.? == 1234);
    }
}

test "catch" {
    // If a is an error, returns `b`, otherwise returns
    // the unwrapped value of `a`.
    const value: anyerror!u32 = error.Broken;

    const unwrapped = value catch 1234;
    try expect(unwrapped == 1234);
}

test "comparators" {
    try expect((false and true) == false);
    try expect((false or true) == true);
    try expect(!false == true);
    try expect((1 == 1) == true);

    const value: ?u32 = null;
    try expect(value == null);

    try expect((1 != 1) == false);
    try expect((1 < 1) == false);
    try expect((1 != 1) == false);
    try expect((2 > 1) == true);
    // expect((2 => 1) == true);
}

test "arrays" {
    // Array concatenation
    {
        const array1 = [_]u32{ 1, 2 };
        const array2 = [_]u32{ 3, 4 };
        const array3 = array1 ++ array2;
        try expect(array3[0] == 1);
        try expect(array3[3] == 4);
    }

    // Array multiplication
    {
        const pattern = "ab" ** 3;
        try expect(pattern[0] == 'a');
        try expect(pattern[5] == 'b');
    }
}

// test "pointers" {
//     // Pointer dereference
//     {
//         const x: u32 = 1234;
//         const pointer = &x;
//     }
// }

// test "errors" {
//     const A = error{One};
//     const B = error{Two};
//     expect((A || B) == error{One, Two});
// }
