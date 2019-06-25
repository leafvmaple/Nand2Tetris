`include "HalfAdder.v"

module FullAdder(sum, carry, a, b, c);

output sum, carry;
input a, b, c;

wire inetsum, carry1, carry2;

HalfAdder HalfAdder_Gate1(inetsum, carry1, a, b);
HalfAdder HalfAdder_Gate2(sum, carry2, c, inetsum);
or(carry, carry1, carry2);

endmodule