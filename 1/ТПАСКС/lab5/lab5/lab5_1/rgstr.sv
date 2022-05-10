module rgstr (arst, ena, clk, d, q);
parameter width_rg = 8;

input clk, arst, ena;
input [width_rg-1:0] d;
output reg [width_rg-1:0] q;

always @(posedge clk, negedge arst)
if (arst == 1'b0) q <= {width_rg{1'b0}}; 
else if (ena) q <= d;

endmodule 