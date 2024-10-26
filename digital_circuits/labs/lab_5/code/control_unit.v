module control_unit (
 clk,rst,en,en_alu,en_ram_out	,ins,
	offset_addr,en_ram_in,	en_group_pulse,en_pc_pulse,reg_en,alu_in_sel,alu_func,pc_ctrl  		
);
input clk,rst,en,en_alu	,en_ram_out;	
input [15:0] ins;
output en_ram_in,en_group_pulse,en_pc_pulse,alu_in_sel;	
output [7:0]	offset_addr;
output [3:0]	reg_en;
output [2:0]	alu_func;
output [1:0]	pc_ctrl;

wire [15:0] ir_out ;
wire	en_out ;
reg [7:0] offset_addr;
ir ir1 (
				.clk(clk)	,
				.rst(rst)   ,
				.ins(ins)   ,
				.en_in(en_ram_out)	,
				.en_out(en_out)		,
				.ir_out(ir_out)
				);
	
	
state_transition state_transition1(
					.clk(clk) ,
					.rst(rst) ,
					.en_in(en) ,
					.en1(en_out) ,
					.en2(en_alu) ,
					.rd(ir_out[11:10]) ,
					.opcode(ir_out[15:12])  ,
					.en_fetch_pulse(en_ram_in),	
					.en_group_pulse(en_group_pulse),
					.en_pc_pulse(en_pc_pulse)  ,
					.pc_ctrl(pc_ctrl) ,
					.reg_en(reg_en) ,
					.alu_in_sel(alu_in_sel)	,
					.alu_func(alu_func)			
				);
				
always @ (en_out,ir_out) 
begin
	offset_addr = ir_out[7:0];
end


endmodule







