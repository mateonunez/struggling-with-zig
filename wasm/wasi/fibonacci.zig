const std = @import("std");
fn fibonacci(n: u32) u32 {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const args = try std.process.argsAlloc(std.heap.page_allocator);

    var x: u32 = undefined;
    if (args.len > 1) {
        x = try std.fmt.parseInt(u32, args[1], 10);
    }
    try stdout.print("fibonacci({}) = {}\n", .{ x, fibonacci(x) });
}
