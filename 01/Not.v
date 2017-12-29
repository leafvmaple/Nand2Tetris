module Not(out, in);

output out;
input in;

nand(out, in, in);

endmodule