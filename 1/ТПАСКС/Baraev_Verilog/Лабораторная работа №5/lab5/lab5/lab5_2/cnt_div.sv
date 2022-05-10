module cnt_div (clk, ena);
parameter prm = 3;

input clk;
output reg ena;

reg [24:0]divcounter;

always @(posedge clk)
	if(divcounter + 1 == prm) begin
		divcounter <= 0;
		ena <= 1;
	end
	else begin
		divcounter <= divcounter + 1;
		ena <= 0;
	end

endmodule 