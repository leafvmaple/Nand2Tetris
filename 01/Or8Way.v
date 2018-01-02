`include "Or.v"

module Or8Way(out, in);

output out;
input [7:0] in;

wire list [6:1];

Or Or_Gate0(list[1], in[1], in[0]);
Or Or_Gate1(list[2], list[1], in[2]);
Or Or_Gate2(list[3], list[2], in[3]);
Or Or_Gate3(list[4], list[3], in[4]);
Or Or_Gate4(list[5], list[4], in[5]);
Or Or_Gate5(list[6], list[5], in[6]);
Or Or_Gate6(out, list[6], in[7]);

endmodule