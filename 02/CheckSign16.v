`include "FullAdder.v"

module Add16(out, in);

output out;
input [15:0] in;

and(out, in[15], in[15])

endmodule