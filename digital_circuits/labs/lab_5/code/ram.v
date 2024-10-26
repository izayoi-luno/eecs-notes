`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/26 12:23:56
// Design Name: 
// Module Name: ram
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


module ram(clk,rst,addr,en_ram_in,ins,en_ram_out);
input clk,rst;
input [15:0] addr;
input en_ram_in;
output reg [15:0] ins;
output reg en_ram_out;

reg[15:0] ram[15:0];
initial
begin
    // example?1+2+4...
    ram[0] = 16'b0010_0000_0000_0001; //add r0 #1
	ram[1] = 16'b0010_0000_0000_0010; //add r0 #2
	ram[2] = 16'b0010_0000_0000_0100; //add r0 #4
	ram[3] = 16'b0111_0000_0000_0000; //jump   #0
	//Annotate sample programs
	//Try to add your own programs and check the results
	/*ram[0] = 16'b0000_0000_0000_0111; //mov r0 #7
    ram[1] = 16'b0000_0100_0000_1000; //mov r1 #8
    ram[2] = 16'b0100_0100_0000_0100; //sub r1-r0
    ram[3] = 16'b0111_0000_0000_0000; //jump   #0*/
end

always @ (posedge clk or negedge rst) begin
	if(!rst) 
	begin
		en_ram_out <= 1'b0;
		ins <= 16'b0000000000000000;
	end
	else
	begin
		if(en_ram_in) 
		begin
			en_ram_out <= 1'b1;
			ins <= ram[addr];
		end
		else 
			en_ram_out <= 1'b0;
	end
end
endmodule

