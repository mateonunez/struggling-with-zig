const expect = @import("std").testing.expect;
const assert = @import("std").debug.assert;
const mem = @import("std").mem;

// array literal
const message = [_]u8{ 'h', 'e', 'l', 'l', 'o' };

// get the size of an array
comptime {
    assert(mem.len(message) == 5);
}

// A string literal is a single-item pointer to an array
const same_message = "hello";

comptime {
    assert(mem.eql(u8, &message, same_message));
}

test "iterate over an array" {
    var sum: usize = 0;
    for (message) |byte| {
        sum += byte;
    }

    try expect(sum == 'h' + 'e' + 'l' * 2 + 'o'); // love it
}

// modifiable arrays
var some_integers: [100]i32 = undefined;

test "modify an array" {
    for (some_integers) |*item, i| {
        item.* = @intCast(i32, i);
    }

    try expect(some_integers[0] == 0);
    try expect(some_integers[99] == 99);
}

// array concatenation works if the values are known
// at compile time
const part_one = [_]i32{ 1, 2, 3 };
const part_two = [_]i32{ 4, 5, 6 };
const part_three = [_]i32{ 7, 8, 9 };
const together = part_one ++ part_two ++ part_three;

comptime {
    assert(mem.eql(i32, &together, &[_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9 }));
}

// string literals are arrays
const hello = "hello";
const world = "world";
const hello_world = hello ++ " " ++ world;

comptime {
    assert(mem.eql(u8, hello_world, "hello world"));
}

// ** does repeating patterns
const repeating = [_]i32{ 1, 2, 3 } ** 3;
comptime {
    assert(mem.eql(i32, &repeating, &[_]i32{ 1, 2, 3, 1, 2, 3, 1, 2, 3 }));
}

const pattern = "ab" ** 3;
comptime {
    assert(mem.eql(u8, pattern, "ababab"));
}

// initialize an array to zero
const all_zeros = [_]u16{0} ** 100;
comptime {
    assert(all_zeros.len == 100);
    assert(all_zeros[33] == 0);
}

// use compile-time code to inizialize an array
var fancy_array = init: {
    var init_val: [10]Point = undefined;
    for (init_val) |*item, i| {
        item.* = Point{
            .x = @intCast(i32, i),
            .y = @intCast(i32, i * 2),
        };
    }
    break :init init_val;
};
const Point = struct {
    x: i32,
    y: i32,
};

test "compile-time array initialization" {
    try expect(fancy_array[0].x == 0);
    try expect(fancy_array[0].y == 0);
    try expect(fancy_array[9].x == 9);
    try expect(fancy_array[9].y == 18);
}

// calling a function to initialize an array
var more_points = [_]Point{makePoint(3)} ** 10;
fn makePoint(x: i32) Point {
    return Point{
        .x = x,
        .y = x * 2,
    };
}

test "array initialization with function calls" {
    try expect(more_points[0].x == 3);
    try expect(more_points[0].y == 6);
    try expect(more_points[9].x == 3);
    try expect(more_points[9].y == 6);
}
