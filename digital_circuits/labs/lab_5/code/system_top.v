`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/25 15:45:01
// Design Name: 
// Module Name: system_top
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


module system_top(
input clk
    );

wire        en_ram_out;
wire [15:0] addr;
wire        en_ram_in;
wire [15:0] ins;

wire locked;
wire clk_50mhz;
  clk_wiz u_clk_wiz
   (
    // Clock out ports
    .clk_out1(clk_50mhz),     // output clk_out1
    // Status and control signals
    .resetn(1), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk));      // input clk_in1



cpu u_cpu (
.clk(clk_50mhz),
.rst(locked),
.en_in(locked),
.en_ram_out(en_ram_out),
.addr(addr),
.ins(ins),
.en_ram_in(en_ram_in)
 	);


ram u_ram (
.clk(clk_50mhz),
.rst(locked),
.addr(addr),
.en_ram_in(en_ram_in),
.ins(ins),
.en_ram_out(en_ram_out)
    );


endmodule
