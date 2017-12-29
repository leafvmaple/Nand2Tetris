module Mux(out, a, b, sel);

output out;
input a, b, sel;

wire nsel, sela, selb;

not(nsel, sel);
and(sela, a, nsel);
and(selb, b, sel);
or(out, sela, selb);

endmodule