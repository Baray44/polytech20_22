`timescale 1 ns / 1 ns
module tb_Lab3_top ();
bit clk;
bit reset;
bit[7:0] 	ledA;
bit[31:0] 	ledB;

always 	#50 clk = ~ clk;

initial
begin
	clk 	= 1'b0;
	reset 	= 1'b0;
	#200;
	reset 	= 1'b1;
	#1000;
	$stop;
end 

Lab3_top Lab3_top_inst (.*);

endmodule 

