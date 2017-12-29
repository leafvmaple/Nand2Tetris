module DMux(a, b, in, sel);

output a, b;
input in, sel;

wire nsel;

not(nsel, sel);
and(a, in, nsel);
and(b, in, sel);

endmodule
