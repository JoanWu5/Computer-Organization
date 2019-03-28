`include "ctrl_encode_def.v"
`include "instruction_def.v"

module Ctrl(jump,RegDst,Branch,MemR,Mem2R,MemW,RegW,Alusrc,ExtOp,Aluctrl,OpCode,funct);
	
	input [5:0]		OpCode;				
	input [5:0]		funct;				

  output reg jump;
	output reg RegDst;						
	output reg Branch;						
	output reg MemR;						
	output reg Mem2R;					
	output reg MemW;						
	output reg RegW;						
	output reg Alusrc;						
	output reg [1:0] ExtOp;						
	output reg [4:0] Aluctrl;						
	
	
	always@(OpCode or funct)
	begin
	  
		case(OpCode)
		  `INSTR_RTYPE_OP: //R type 000000
		  begin
		    assign jump=0;
		    assign Branch=0;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=0;
		    assign ExtOp=`EXT_ZERO;
		    assign RegDst=1;
		    case(funct)
		      
		      `INSTR_ADDU_FUNCT: //ADDU
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_ADDU;
		      end
		      
		      `INSTR_SUBU_FUNCT: //SUBU
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_SUBU;
		      end
		      
		      `INSTR_ADD_FUNCT: //ADD
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_ADD;
		      end
		      
		      `INSTR_SUB_FUNCT: //SUB
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_SUB;
		      end
		      		      
		      `INSTR_OR_FUNCT: //OR
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_OR;
		      end
		      
		      `INSTR_AND_FUNCT: //AND
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_AND;
		      end
		      
		      `INSTR_SLT_FUNCT: //SLT
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_SLT;
		      end
		      
		      `INSTR_SLL_FUNCT: //SLL
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_SLL;
		      end
		      
		      `INSTR_SRL_FUNCT: //SRL
		      begin
		          assign RegW=1;
		          assign Aluctrl=`ALUOp_SRL;
		      end
		      
		      default:;
		    endcase
		  end
		  
		  `INSTR_ORI_OP: //ORI
		  begin
		    assign jump=0;
		    assign Branch=0;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=1;
		    assign ExtOp=`EXT_ZERO;
		    assign RegDst=0;
		    assign RegW=1;
		    assign Aluctrl=`ALUOp_OR;	  
		  end		
		  
		  `INSTR_ADDI_OP: //ADDI
		  begin
		    assign jump=0;
		    assign Branch=0;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=1;
		    assign ExtOp=`EXT_ZERO;
		    assign RegDst=0;
		    assign RegW=1;
		    assign Aluctrl=`ALUOp_ADD;	  
		  end		
		  
		  `INSTR_LUI_OP: //LUI
		  begin
		    assign jump=0;
		    assign Branch=0;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=1;
		    assign ExtOp=`EXT_SIGNED;
		    assign RegDst=0;
		    assign RegW=1;
		    assign Aluctrl=`ALUOp_LUI;	  
		  end
		  
		  `INSTR_SW_OP: //SW
		  begin
		    assign jump=0;
		    assign Branch=0;
		    assign Mem2R=0;
		    assign MemW=1;
		    assign MemR=0;
		    assign Alusrc=1;
		    assign ExtOp=`EXT_SIGNED;
		    assign RegDst=0;
		    assign RegW=0;
		    assign Aluctrl=`ALUOp_ADD;	  
		  end
		  
		  `INSTR_LW_OP: //LW
		  begin
		    assign jump=0;
		    assign Branch=0;
		    assign Mem2R=1;
		    assign MemW=0;
		    assign MemR=1;
		    assign Alusrc=1;
		    assign ExtOp=`EXT_SIGNED;
		    assign RegDst=0;
		    assign RegW=1;
		    assign Aluctrl=`ALUOp_ADD;	  
		  end
		  
		  `INSTR_BEQ_OP: //BEQ
		  begin
		    assign jump=0;
		    assign Branch=1;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=0;
		    assign ExtOp=`EXT_SIGNED;
		    assign RegDst=0;
		    assign RegW=0;
		    assign Aluctrl=`ALUOp_EQL;	  
		  end
		  
		  `INSTR_BNE_OP: //BNE
		  begin
		    assign jump=0;
		    assign Branch=1;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=0;
		    assign ExtOp=`EXT_SIGNED;
		    assign RegDst=0;
		    assign RegW=0;
		    assign Aluctrl=`ALUOp_BNE;	  
		  end
		  
		  `INSTR_J_OP: //J
		  begin
		    assign jump=1;
		    assign Branch=0;
		    assign Mem2R=0;
		    assign MemW=0;
		    assign MemR=0;
		    assign Alusrc=0;
		    assign ExtOp=`EXT_SIGNED;
		    assign RegDst=0;
		    assign RegW=0;
		    assign Aluctrl=`ALUOp_SUB;	  
		  end
		    
	  endcase
	  
	end
endmodule
