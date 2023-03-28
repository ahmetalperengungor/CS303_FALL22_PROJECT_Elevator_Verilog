`timescale 1ns / 1ps

/*
clk_divider module reduces 100MHz (10ns) clock 
to 50Hz (20ms) by dividing the clock with 1000000
It is possible to change the frequency of the output clock
by changing the toggle_value
*/

module clk_divider(
	input clk_in,
	input rst,
	output reg divided_clk
    );

parameter toggle_value = 1000000;
reg [24:0] cnt = 0;

initial begin
    divided_clk <=0;
end


always@(posedge clk_in or negedge rst)
begin
	if (rst==0) begin
		cnt <= 0;
		divided_clk <= 0;
	end
	else begin
		if (cnt==toggle_value) begin
			cnt <= 0;
			divided_clk <= ~divided_clk;
		end
		else begin
			cnt <= cnt +1;
			divided_clk <= divided_clk;		
		end
	end

end
	
endmodule
