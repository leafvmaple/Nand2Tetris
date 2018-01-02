`include "Mux4Way16.v"

module Mux8Way16(out, a, b, c, d, e, f, g, h, sel);

output [15:0] out;
input [15:0] a, b, c, d, e, f, g, h;
input [2:0] sel;

wire [15:0] abcdsel, efghsel;

Mux4Way16 Mux4Way16_Gate0(abcdsel, a, b, c, d, sel[1:0]);
Mux4Way16 Mux4Way16_Gate1(efghsel, e, f, g, h, sel[1:0]);
Mux16 Mux16_Gate0(out, abcdsel, efghsel, sel[2]);

endmodule