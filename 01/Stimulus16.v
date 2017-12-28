`include "And16.v"

module stimulus16;

reg [15:0] A, B;
wire [15:0] OUT;

And16 And16_tst(OUT, A, B);

initial
begin
  $monitor($time, " A = %b, B = %b, OUT = %b ", A, B, OUT);
end

initial
begin
  A = 16'h0; B = 16'h0;
  #5 A = 16'h0; B = 16'h10;
  #5 A = 16'h10; B = 16'h0;
  #5 A = 16'h10; B = 16'h10;
end

endmodule
