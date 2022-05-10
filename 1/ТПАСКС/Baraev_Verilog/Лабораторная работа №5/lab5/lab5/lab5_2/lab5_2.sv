module lab5_2 (clk, d, key, led);
parameter width = 8;

input key;
input clk;
input [width-1:0] d;
output [width-1:0] led;

wire ena_rgstr;
reg [width-1:0] res;

cnt_div #(4) cnt(clk, ena_rgstr);

rgstr #(width) output_rgstr(clk, ena_rgstr, key, d, res);

assign led = res; 

endmodule