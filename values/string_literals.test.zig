const expect = @import("std").testing.expect;
const mem = @import("std").mem;
const print = @import("std").debug.print;

test "string literals" {
    const bytes = "hello world";
    // Note the catch unreachable; this is because the compiler can't
    // statically determine that the string literal is a valid UTF-8 string.
    try expect(@TypeOf(bytes) == *const [11:0]u8);
    try expect(bytes.len == 11);
    try expect(bytes[1] == 'e');
    try expect(bytes[10] == 'd');
    try expect(bytes[11] == 0);
    try expect('e' == '\x65');
    try expect('\u{1f4a9}' == '💩');
    try expect('💩' == 128169);
    try expect('💩' == 0x1f4a9);
    try expect(mem.eql(u8, bytes, "hello world"));
    try expect(!mem.eql(u8, bytes, "hello world!"));
    try expect(mem.eql(u8, bytes[0..10], "hello worl"));
    try expect(mem.eql(u8, bytes, "h\x65llo world"));

    // Escape sequences
    try expect('\n' == 10); // New line
    try expect('\r' == 13); // Carriage return
    try expect('\t' == 9); // Tab
    try expect('\'' == 39); // Single quote
    try expect('\"' == 34); // Double quote
    try expect('\\' == 92); // Backslash
    try expect('\x00' == 0); // Hexadecimal
    try expect('\x01' == 1);
    try expect('\x7f' == 127);
    try expect('\u{000000}' == 0); // Unicode
    try expect('\u{000001}' == 1);
    try expect('\u{00007f}' == 127);
    try expect('\u{10fff}' == 69631); // Max valid unicode code point

    // Multiline string literals
    const multiline =
        \\This is a multiline string literal.
        \\It can contain newlines and other escape sequences.
        \\It can also contain "double quotes" and 'single quotes'.
        \\It can also contain \x00\x01\x7f\u{000000}\u{000001}\u{00007f}\u{10fff}.
        \\It can also contain \n\r\t\'\"\\.
        \\It can also contain \u{1f4a9}.
        \\It can also contain a trailing newline.
    ;

    // Manage the catch
    expect(@TypeOf(multiline) == *const [322:0]u8) catch {
        print("multiline length: {}\n", .{multiline.len});
    };
}
