`include "And.v"

module stimulus;

reg A, B;
wire OUT;

And And_tst(OUT, A, B);

initial
begin
  $monitor($time, " A = %b, B = %b, OUT = %b ", A, B, OUT);
end

initial
begin
  A = 1'b0; B = 1'b0;
  #5 A = 1'b0; B = 1'b1;
  #5 A = 1'b1; B = 1'b0;
  #5 A = 1'b1; B = 1'b1;
end

endmodule
