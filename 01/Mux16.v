`include "Mux.v"

module Mux16(out, a, b, sel);

output [15:0] out;
input [15:0] a, b;
input sel;

Mux Mux_Gate[15:0](out, a, b, sel);

endmodule