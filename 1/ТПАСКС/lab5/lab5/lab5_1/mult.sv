module mult (a, b, result);
parameter width_mult = 8;

input [width_mult-1:0] a, b;
output [2*width_mult-1:0] result;

assign result = a*b;

endmodule
