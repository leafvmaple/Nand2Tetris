`include "Not.v"

module Not16(out, in);

output [15:0] out;
input [15:0] in;

Not Not_Gate[15:0](out, in);

endmodule