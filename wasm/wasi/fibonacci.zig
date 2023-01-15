const std = @import("std");

fn fibonacci(n: u32) u32 {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var x: u32 = 5;

    try stdout.print("fibonacci({}) = {}\n", .{ x, fibonacci(x) });
}
