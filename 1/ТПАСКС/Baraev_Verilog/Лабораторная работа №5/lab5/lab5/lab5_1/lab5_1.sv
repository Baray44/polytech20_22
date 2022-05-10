module lab5_1 (arst, ena, clk, da, db, result);
parameter width = 4;

input clk, arst, ena;
input [width-1:0] da, db;
output [2*width-1:0] result;

wire [width-1:0] da_int, db_int;
wire [2*width-1:0] mult_res;

rgstr #width input_rg_1 (arst, ena, clk, da, da_int);
rgstr #width input_rg_2 (.arst(arst),
								 .ena(ena), .clk(clk),
								 .d(db),
								 .q (db_int) );

mult #width mult_ (da_int, db_int, mult_res);

rgstr #(2*width) output_rg (arst, ena, clk, mult_res, result);

endmodule 