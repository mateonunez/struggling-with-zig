const std = @import("std");
const print = std.debug.print;
const assert = std.debug.assert;

/// String literals 

pub fn main() void {
    // signed 8-bit integer, max value
    const signed_8int: i8 = 127;
    assert(signed_8int == 127);
    print("signed_8int: {}\n", .{signed_8int});

    // unsigned 8-bit integer, max value
    const unsigned_8int: u8 = 255;
    assert(unsigned_8int == 255);
    print("unsigned_8int: {}\n", .{unsigned_8int});

    // signed 16-bit integer, max value
    const signed_16int: i16 = 32767;
    assert(signed_16int == 32767);
    print("signed_16int: {}\n", .{signed_16int});

    // unsigned 16-bit min max value 
    const unsigned_16int: u16 = 65535;
    assert(unsigned_16int == 65535);
    print("unsigned_16int: {}\n", .{unsigned_16int});

    // signed 32-bit integer, max value
    const signed_32int: i32 = 2147483647;
    assert(signed_32int == 2147483647);
    print("signed_32int: {}\n", .{signed_32int});

    // unsigned 32-bit integer, max value
    const unsigned_32int: u32 = 4294967295;
    assert(unsigned_32int == 4294967295);
    print("unsigned_32int: {}\n", .{unsigned_32int});

    // signed 64-bit integer, max value
    const signed_64int: i64 = 9223372036854775807;
    assert(signed_64int == 9223372036854775807);
    print("signed_64int: {}\n", .{signed_64int});

    // unsigned 64-bit integer, max value
    const unsigned_64int: u64 = 18446744073709551615;
    assert(unsigned_64int == 18446744073709551615);
    print("unsigned_64int: {}\n", .{unsigned_64int});

    // signed 128-bit integer, max value
    const signed_128int: i128 = 170141183460469231731687303715884105727;
    assert(signed_128int == 170141183460469231731687303715884105727);
    print("signed_128int: {}\n", .{signed_128int});

    // unsigned 128-bit integer, max value
    const unsigned_128int: u128 = 340282366920938463463374607431768211455;
    assert(unsigned_128int == 340282366920938463463374607431768211455);
    print("unsigned_128int: {}\n", .{unsigned_128int});

    // signed pointer size integer, max value
    const signed_ptrsizeint: isize = 9223372036854775807;
    assert(signed_ptrsizeint == 9223372036854775807);
    print("signed_ptrsizeint: {}\n", .{signed_ptrsizeint});

    // unsigned pointer size integer, max value
    const unsigned_ptrsizeint: usize = 18446744073709551615;
    assert(unsigned_ptrsizeint == 18446744073709551615);
    print("unsigned_ptrsizeint: {}\n", .{unsigned_ptrsizeint});

    // There are arbitrary values for integers by using an identifier
    // of `i` or `u` followed by a number of digits. The maximum number of digits
    // of an integer type is `65535`.
    // max value
    const i3_type: i3 = 3;
    assert(i3_type == 3);
    print("i3: {}\n", .{i3_type});

    const u3_type: u3 = 3;
    assert(u3_type == 3);
    print("u3: {}\n", .{u3_type});

    // short - for ABI compatibility with C
    const short: c_short = 32767;
    assert(short == 32767);
    print("short: {}\n", .{short});

    // unsigned short - for ABI compatibility with C
    const unsigned_short: c_ushort = 65535;
    assert(unsigned_short == 65535);
    print("unsigned_short: {}\n", .{unsigned_short});

    // int - for ABI compatibility with C
    const int: c_int = 2147483647;
    assert(int == 2147483647);
    print("int: {}\n", .{int});

    // unsigned int - for ABI compatibility with C
    const unsigned_int: c_uint = 4294967295;
    assert(unsigned_int == 4294967295);
    print("unsigned_int: {}\n", .{unsigned_int});

    // long - for ABI compatibility with C
    const long: c_long = 9223372036854775807;
    assert(long == 9223372036854775807);
    print("long: {}\n", .{long});

    // unsigned long - for ABI compatibility with C
    const unsigned_long: c_ulong = 18446744073709551615;
    assert(unsigned_long == 18446744073709551615);
    print("unsigned_long: {}\n", .{unsigned_long});

    // long long - for ABI compatibility with C
    const long_long: c_longlong = 9223372036854775807;
    assert(long_long == 9223372036854775807);
    print("long_long: {}\n", .{long_long});

    // unsigned long long - for ABI compatibility with C
    const unsigned_long_long: c_ulonglong = 18446744073709551615;
    assert(unsigned_long_long == 18446744073709551615);
    print("unsigned_long_long: {}\n", .{unsigned_long_long});

    // long double - for ABI compatibility with C
    const long_double: c_longdouble = 1.797693134862315708145274237317043567981e+308;
    assert(long_double == 1.797693134862315708145274237317043567981e+308);
    print("long_double: {}\n", .{long_double});

    // float16 - 16-bit floating point number
    const float16: f16 = 65504.0;
    assert(float16 == 65504.0);
    print("float16: {}\n", .{float16});

    // float - 32-bit floating point number
    const float: f32 = 3.40282346638528859811704183484516925440e+38;
    assert(float == 3.40282346638528859811704183484516925440e+38);
    print("float: {}\n", .{float});

    // double - 64-bit floating point number
    const double: f64 = 1.797693134862315708145274237317043567981e+308;
    assert(double == 1.797693134862315708145274237317043567981e+308);
    print("double: {}\n", .{double});

    // float128 - 128-bit floating point number
    const float128: f128 = 1.18973149535723176508575932662800702e+4932;
    assert(float128 == 1.18973149535723176508575932662800702e+4932);
    print("float128: {}\n", .{float128});

    // bool true
    const bool_true: bool = true;
    assert(bool_true == true);
    print("bool_true: {}\n", .{bool_true});

    // bool false
    const bool_false: bool = false;
    assert(bool_false == false);
    print("bool_false: {}\n", .{bool_false});

    // anyopaque - used for type-erased pointers
    // const anyop: anyopaque = undefined;
    // assert(anyop == undefined);

    // void - used for functions that return no value
    const void_type: void = undefined;
    assert(void_type == undefined);
    print("void_type: {}\n", .{void_type});

    // noreturn - the type of break, continue, return, unreachable, and while(true) {}
    // const noreturn_type: noreturn = ;
    // assert(noreturn_type == undefined);
    // print("noreturn_type: {}\n", .{noreturn_type});

    // type - the type of types
    const type_type: type = bool;
    assert(type_type == bool);
    print("type_type: {}\n", .{type_type});

    // anyerror - an error code
    const anyerror_type: anyerror = error.OutOfMemory;
    assert(anyerror_type == error.OutOfMemory);
    print("anyerror_type: {}\n", .{anyerror_type});

    // comptime_int - Only allower for comptime known values.
    const comptime_int_type: comptime_int = 1;
    assert(comptime_int_type == 1);
    print("comptime_int_type: {}\n", .{comptime_int_type});

    // comptime_float - Only allower for comptime known values.
    const comptime_float_type: comptime_float = 1.0;
    assert(comptime_float_type == 1.0);
    print("comptime_float_type: {}\n", .{comptime_float_type});
}
