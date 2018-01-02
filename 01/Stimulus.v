//`include "And.v"
//`include "Not.v"
//`include "Or.v"
//`include "DMux.v"
//`include "Mux.v"
//`include "Or8Way.v"

module stimulus;

reg A, B, C;
reg [7:0] A8;
wire OA, OB;

//Not Not_tst(OA, A);
//And And_tst(OA, A, B);
//Or Or_tst(OA, A, B);
//DMux DMux_tst(OA, OB, A, B);
//Mux Mux_tst(OA, A, B, C);
//Or8Way Or8Way_tst(OA, A8);

initial
begin
  //$monitor($time, " A = %b, OUT = %b ", A, OA);
  //$monitor($time, " IN = %b, OUT = %b ", A8, OA);
  //$monitor($time, " A = %b, B = %b, OUT = %b ", A, B, OA);
  //$monitor($time, " A = %b, B = %b, OA = %b, OB = %b ", A, B, OA, OB);
  //$monitor($time, " A = %b, B = %b, C = %b, OUT = %b ", A, B, C, OA);
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
