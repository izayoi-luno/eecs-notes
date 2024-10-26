`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/25 16:07:04
// Design Name: 
// Module Name: system_top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module system_top_tb();
reg clk;

system_top t_system_top (
.clk(clk)
    );


parameter Tclk = 10;

initial begin
			clk=0;
			forever #(Tclk/2) clk=~clk;
		end

endmodule
