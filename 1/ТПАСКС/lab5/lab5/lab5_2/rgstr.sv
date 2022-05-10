module rgstr (clk, ena, key, d, q);
parameter width = 8;

input clk, ena, key;
input [width-1:0] d;
output reg [width-1:0] q;

reg [width-1:0] val;
wire tmp;
integer i;


always @(posedge clk)
	if (key) val <= d;
	else if (ena) begin
		tmp = val[width - 1];
		for (i = 1; i <= width - 1; i = i + 1)
			val[width - i] <= val[width-i-1];
		val[0] = tmp;
	end
	
	assign q = val; 
		
endmodule
