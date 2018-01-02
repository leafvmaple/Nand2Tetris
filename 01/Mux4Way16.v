`include "Mux16.v"

module Mux4Way16(out, a, b, c, d, sel);

output [15:0] out;
input [15:0] a, b, c, d;
input [1:0] sel;

wire [15:0] absel, cdsel;

Mux16 Mux_Gate0(absel, a, b, sel[0]);
Mux16 Mux_Gate1(cdsel, c, d, sel[0]);
Mux16 Mux_Gate2(out, absel, cdsel, sel[1]);

endmodule