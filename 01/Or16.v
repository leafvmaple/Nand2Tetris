`include "Or.v"

module Or16(out, a, b);

output [15:0] out;
input [15:0] a, b;

Or Or_Gate[15:0](out, a, b);

endmodule