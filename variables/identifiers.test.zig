const @"idetifier with spaces in it" = 0xff;
const @"1small" = 0x1;

const c = @import("std").c;
const expect = @import("std").testing.expect;

pub extern "c" fn @"error"() void;
pub extern "c" fn @"fstat$INODE64"(fd: c.fd_t, buf: *c.Stat) c_int;

const Color = enum {
    red,
    @"really red",
};

const color: Color = .@"really red";

test "identifier with spaces" {
    try expect(color == .@"really red");
}
