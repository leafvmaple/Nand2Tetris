`include "And.v"

module And16(out, a, b);

output [15:0] out;
input [15:0] a, b;

And And_Gate[15:0](out, a, b);

endmodule