//`include "Not16.v"
//`include "And16.v"
//`include "Or16.v"
//`include "Mux16.v"

module stimulus16;

reg [15:0] A, B, C;
reg SEL;
wire [15:0] OUT;

//Not16 Not16_tst(OUT, A);
//And16 And16_tst(OUT, A, B);
//Or16 Or16_tst(OUT, A, B);
//Mux16 Mux16_tst(OUT, A, B, SEL);

initial
begin
  //$monitor($time, " A = %b, OUT = %b ", A, OUT);
  //$monitor($time, " A = %b, B = %b, OUT = %b ", A, B, OUT);
  //$monitor($time, " A = %b, B = %b, SEL = %b, OUT = %b ", A, B, SEL, OUT);
end

initial
begin
  A = 16'h0; B = 16'h0; C = 16'h0; SEL = 1'b0;
  #5 A = 16'h0; B = 16'h10; C = 16'h0; SEL = 1'b0;
  #5 A = 16'h10; B = 16'h0; C = 16'h0; SEL = 1'b0;
  #5 A = 16'h10; B = 16'h10; C = 16'h0; SEL = 1'b0;
  #5 A = 16'h0; B = 16'h0; C = 16'h10; SEL = 1'b1;
  #5 A = 16'h0; B = 16'h10; C = 16'h10; SEL = 1'b1;
  #5 A = 16'h10; B = 16'h0; C = 16'h10; SEL = 1'b1;
  #5 A = 16'h10; B = 16'h10; C = 16'h10; SEL = 1'b1;
end

endmodule
