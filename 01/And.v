module And(out, a, b);

output out;
input a, b;

wire nda;

nand(nda, a, b);
nand(out, nda, nda);

endmodule
