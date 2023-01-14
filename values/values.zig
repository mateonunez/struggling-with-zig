// Top-level declaration are order-independent.
const print = std.debug.print;
const std = @import("std");
const assert = std.debug.assert;

pub fn main() !void {
    // integers
    const three_plus_three: i32 = 3 + 3;
    assert(three_plus_three == 6); // assert is a top-level declaration
    print("3 + 3 = {}\n", .{three_plus_three});

    // floats
    const three_div_two: f32 = 3.0 / 2.0;
    assert(three_div_two == 1.5);
    print("3 / 2 = {}\n", .{three_div_two});

    // boolean
    const is_true: bool = true;
    const is_false: bool = false;
    const is_true_and_false: bool = is_true and is_false;
    const is_true_or_false: bool = is_true or is_false;
    const is_true_xor_false: bool = is_true != is_false;
    const is_true_not: bool = !is_true;
    assert(is_true_and_false == false);
    assert(is_true_or_false == true);
    assert(is_true_xor_false == true);
    assert(is_true_not == false);
    print("true and false = {}\n", .{is_true_and_false});
    print("true or false = {}\n", .{is_true_or_false});
    print("true xor false = {}\n", .{is_true_xor_false});
    print("not true = {}\n", .{is_true_not});

    // optional
    var optional_value: ?[]const u8 = null;
    assert(optional_value == null);
    print("\noptional 1\ntype: {s}\nvalue: {?s}\n", .{
        @typeName(@TypeOf(optional_value)),
        optional_value,
    });

    optional_value = "hello";
    assert(optional_value != null);
    print("\noptional 2\ntype: {s}\nvalue: {?s}\n", .{
        @typeName(@TypeOf(optional_value)),
        optional_value,
    });

    // error union
    var number_or_error: anyerror!i32 = error.ArgNotFound;
    assert(number_or_error catch |err| err == error.ArgNotFound);
    print("\nerror union 1\ntype: {s}\nvalue: {!}\n", .{
        @typeName(@TypeOf(number_or_error)),
        number_or_error,
    });

    number_or_error = 1234;
    assert(try number_or_error == 1234);
    print("\nerror union 2\ntype: {s}\nvalue: {!}\n", .{
        @typeName(@TypeOf(number_or_error)),
        number_or_error,
    });
}
