//`include "HalfAdder.v"
`include "FullAdder.v"

module stimulus;

reg A, B, C;
reg [7:0] A8;
wire OA, OB;

//HalfAdder HalfAdder_tst(OA, OB, A, B);
FullAdder FullAdder_tst(OA, OB, A, B, C);

initial
begin
  //$monitor($time, " A = %b, OUT = %b ", A, OA);
  //$monitor($time, " IN = %b, OUT = %b ", A8, OA);
  //$monitor($time, " A = %b, B = %b, OUT = %b ", A, B, OA);
  //$monitor($time, " A = %b, B = %b, OA = %b, OB = %b ", A, B, OA, OB);
  //$monitor($time, " A = %b, B = %b, C = %b, OUT = %b ", A, B, C, OA);
  $monitor($time, " A = %b, B = %b, C = %b, OUT = %b ", A, B, C, OA, OB);
end

initial
begin
  A = 1'b0; B = 1'b0; C = 1'b0; A8 = 8'h00;
  #5 A = 1'b0; B = 1'b1; C = 1'b0; A8 = 8'h01;
  #5 A = 1'b1; B = 1'b0; C = 1'b0; A8 = 8'h0b;
  #5 A = 1'b1; B = 1'b1; C = 1'b0; A8 = 8'h0f;
  #5 A = 1'b0; B = 1'b0; C = 1'b1; A8 = 8'h10;
  #5 A = 1'b0; B = 1'b1; C = 1'b1; A8 = 8'h1f;
  #5 A = 1'b1; B = 1'b0; C = 1'b1; A8 = 8'hbf;
  #5 A = 1'b1; B = 1'b1; C = 1'b1; A8 = 8'hff;
end

endmodule
