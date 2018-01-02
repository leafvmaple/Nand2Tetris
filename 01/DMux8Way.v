`include "DMux4Way.v"

module DMux8Way(a, b, c, d, e, f, g, h, in, sel);

output a, b, c, d, e, f, g, h;
input in;
input [2:0] sel;

wire selabcd, selefgh;

DMux DMux_Gate0(selabcd, selefgh, in, sel[2]);
DMux4Way DMux4Way_Gate0(a, b, c, d, selabcd, sel[1:0]);
DMux4Way DMux4Way_Gate1(e, f, g, h, selefgh, sel[1:0]);

endmodule