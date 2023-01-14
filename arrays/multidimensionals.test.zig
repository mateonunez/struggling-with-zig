const expect = @import("std").testing.expect;
const assert = @import("std").debug.assert;
const mem = @import("std").mem;

const matrix = [4][4]i32{
    [_]i32{ 1, 2, 3, 4 },
    [_]i32{ 5, 6, 7, 8 },
    [_]i32{ 9, 10, 11, 12 },
    [_]i32{ 13, 14, 15, 16 },
};

test "multidimensional arrays" {
    try expect(matrix[3][3] == 16);

    for (matrix) |row, i| {
        for (row) |col, j| {
            try expect(col == matrix[i][j]);
        }
    }
}
