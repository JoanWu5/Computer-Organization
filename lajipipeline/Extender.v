`include "ctrl_encode_def.v"
module Extender(ExtOut,DataIn,ExtOp);

	input [15:0] DataIn;
	input [1:0] ExtOp;
	output reg[31:0] ExtOut;
	
	integer i;					//逻辑计数
	
	always@(DataIn or ExtOp)
	begin
			case (ExtOp)
         `EXT_ZERO:    ExtOut = {16'd0, DataIn};
         `EXT_SIGNED:  ExtOut = {{16{DataIn[15]}}, DataIn};
         `EXT_HIGHPOS: ExtOut = {DataIn, 16'd0};
         default: ;
      endcase
	end
endmodule