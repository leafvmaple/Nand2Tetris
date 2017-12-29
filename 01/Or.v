module Or(out, a, b);

output out;
input a, b;

wire na, nb;

nand(na, a, a);
nand(nb, b, b);
nand(out, na, nb);

endmodule