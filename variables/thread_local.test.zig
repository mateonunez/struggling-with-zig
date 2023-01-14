/// A variable may be specified to be a thread-local
/// variable.  This means that each thread has its own
/// copy of the variable.  The variable is declared
/// using the `threadlocal` keyword.
const std = @import("std");
const assert = std.debug.assert;
const print = std.debug.print;

threadlocal var variable: i32 = 1234;

test "thread local storage" {
    const thread1 = try std.Thread.spawn(.{}, testTls, .{});
    const thread2 = try std.Thread.spawn(.{}, testTls, .{});
    testTls();
    thread1.join();
    thread2.join();
}

fn testTls() void {
    assert(variable == 1234);
    variable += 1;
    assert(variable == 1235);
}

// NOTE: For single threaded builds, all thread local variables
// are treated as regular `Container Level Variables`.
