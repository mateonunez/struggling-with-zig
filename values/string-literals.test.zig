const expect = @import("std").testing.expect;
const mem = @import("std").mem;
const print = @import("std").debug.print;

test "string literals" {
    const bytes = "hello world";
    // Note the catch unreachable; this is because the compiler can't
    // statically determine that the string literal is a valid UTF-8 string.
    expect(@TypeOf(bytes) == *const [11:0]u8) catch unreachable;
    expect(bytes.len == 11) catch unreachable;
    expect(bytes[1] == 'e') catch unreachable;
    expect(bytes[10] == 'd') catch unreachable;
    expect(bytes[11] == 0) catch unreachable;
    expect('e' == '\x65') catch unreachable;
    expect('\u{1f4a9}' == '💩') catch unreachable;
    expect('💩' == 128169) catch unreachable;
    expect('💩' == 0x1f4a9) catch unreachable;
    expect(mem.eql(u8, bytes, "hello world")) catch unreachable;
    expect(!mem.eql(u8, bytes, "hello world!")) catch unreachable;
    expect(mem.eql(u8, bytes[0..10], "hello worl")) catch unreachable;
    expect(mem.eql(u8, bytes, "h\x65llo world")) catch unreachable;

    // Escape sequences
    expect('\n' == 10) catch unreachable; // New line
    expect('\r' == 13) catch unreachable; // Carriage return
    expect('\t' == 9) catch unreachable; // Tab
    expect('\'' == 39) catch unreachable; // Single quote
    expect('\"' == 34) catch unreachable; // Double quote
    expect('\\' == 92) catch unreachable; // Backslash
    expect('\x00' == 0) catch unreachable; // Hexadecimal
    expect('\x01' == 1) catch unreachable;
    expect('\x7f' == 127) catch unreachable;
    expect('\u{000000}' == 0) catch unreachable; // Unicode
    expect('\u{000001}' == 1) catch unreachable;
    expect('\u{00007f}' == 127) catch unreachable;
    expect('\u{10fff}' == 69631) catch unreachable; // Max valid unicode code point

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
