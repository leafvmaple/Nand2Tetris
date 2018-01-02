`include "DMux.v"

module DMux4Way(a, b, c, d, in, sel);

output a, b, c, d;
input in;
input [1:0] sel;

wire selab, selcd;

DMux DMux_Gate0(selab, selcd, in, sel[0]);
DMux DMux_Gate1(a, b, selab, sel[1]);
DMux DMux_Gate2(c, d, selcd, sel[1]);

endmodule