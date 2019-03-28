`include "instruction_def.v"
`include "ctrl_encode_def.v"

module Ctrl(jump, RegDst, Branch, MemR, Mem2R, MemW, RegW, Alusrc, ExtOp, Aluctrl, OpCode, funct);
input [5: 0] OpCode;              //指令操作码字段
input [5: 0] funct;               //指令功能字段

output reg jump;                 //指令跳转
output reg RegDst;
output reg Branch;               //分支
output reg MemR;                 //读存储器
output reg Mem2R;                //数据存储器到寄存器堆
output reg MemW;                 //写数据存储器
output reg RegW;                 //寄存器堆写入数据
output reg Alusrc;               //运算器操作数选择
output reg ExtOp;                //位扩展/符号扩展选择
output reg [4: 0] Aluctrl;        //Alu运算选择

always@(OpCode or funct)
begin
    case (OpCode)
        `INSTR_RTYPE_OP:
        begin
            jump = 0;
            RegDst = 1;
            Branch = 0;
            MemR = 0;
            Mem2R = 0;
            MemW = 0;
            RegW = 1;
            Alusrc = 0;
            ExtOp = `EXT_ZERO;

            case (funct)
                `INSTR_ADD_FUNCT:
                    Aluctrl = `ALUOp_ADD;
                `INSTR_ADDU_FUNCT:
                    Aluctrl = `ALUOp_ADDU;
                `INSTR_SUB_FUNCT:
                    Aluctrl = `ALUOp_SUB;
                `INSTR_SUBU_FUNCT:
                    Aluctrl = `ALUOp_SUBU;
                `INSTR_AND_FUNCT:
                    Aluctrl = `ALUOp_AND;
                `INSTR_NOR_FUNCT:
                    Aluctrl = `ALUOp_NOR;
                `INSTR_OR_FUNCT:
                    Aluctrl = `ALUOp_OR;
                `INSTR_XOR_FUNCT:
                    Aluctrl = `ALUOp_XOR;
                `INSTR_SLT_FUNCT:
                    Aluctrl = `ALUOp_SLT;
                `INSTR_SLTU_FUNCT:
                    Aluctrl = `ALUOp_SLTU;
                `INSTR_SLL_FUNCT:
                    Aluctrl = `ALUOp_SLL;
                `INSTR_SRL_FUNCT:
                    Aluctrl = `ALUOp_SRL;
            endcase
        end

        `INSTR_ORI_OP:
        begin
            jump = 0;
            RegDst = 0;
            Branch = 0;
            MemR = 0;
            Mem2R = 0;
            MemW = 0;
            RegW = 1;
            Alusrc = 1;
            ExtOp = `EXT_ZERO;
            Aluctrl = `ALUOp_OR;
        end

        `INSTR_LW_OP:
        begin
            jump = 0;
            RegDst = 0;
            Branch = 0;
            MemR = 1;
            Mem2R = 1;
            MemW = 0;
            RegW = 1;
            Alusrc = 1;
            ExtOp = `EXT_SIGNED;
            Aluctrl = `ALUOp_ADDU;
        end


        `INSTR_SW_OP:
        begin
            jump = 0;
            RegDst = 0;
            Branch = 0;
            MemR = 0;
            Mem2R = 0;
            MemW = 1;
            RegW = 0;
            Alusrc = 1;
            ExtOp = `EXT_SIGNED;
            Aluctrl = `ALUOp_ADDU;
        end


        `INSTR_LUI_OP:
        begin
            jump = 0;
            RegDst = 0;
            Branch = 0;
            MemR = 0;
            Mem2R = 0;
            MemW = 0;
            RegW = 1;
            Alusrc = 1;
            ExtOp = `EXT_SIGNED;
            Aluctrl = `ALUOp_LUI;
        end
        
        `INSTR_BEQ_OP:
        begin
            jump = 0;
            RegDst = 0;
            Branch = 1;
            MemR = 0;
            Mem2R = 0;
            MemW = 0;
            RegW = 0;
            Alusrc = 0;
            ExtOp = `EXT_SIGNED;
            Aluctrl = `ALUOp_SUBU;
        end

        `INSTR_BNE_OP:
        begin
            jump = 0;
            RegDst = 0;
            Branch = 1;
            MemR = 0;
            Mem2R = 0;
            MemW = 0;
            RegW = 0;
            Alusrc = 0;
            ExtOp = `EXT_SIGNED;
            Aluctrl = `ALUOp_BNE;
        end

		`INSTR_J_OP:
		begin
			jump = 1;
			RegDst = 0;
			Branch = 0;
			MemR = 0;
			Mem2R = 0;
			MemW = 0;
			RegW = 0;
			Alusrc = 0;
			ExtOp = `EXT_ZERO;
			Aluctrl = 0;
		end
		
		`INSTR_ADDI_OP:
		begin
			jump = 0;
			RegDst = 0;
			Branch = 0;
			MemR = 0;
			Mem2R = 0;
			MemW = 0;
			RegW = 1;
			Alusrc = 1;
			ExtOp = `EXT_SIGNED;
			Aluctrl = `ALUOp_ADD;
		end
		
        default:
        begin
            jump = 0;
            RegDst = 0;
            Branch = 0;
            MemR = 0;
            Mem2R = 0;
            MemW = 0;
            RegW = 0;
            Alusrc = 0;
            ExtOp = 0;
            Aluctrl = `ALUOp_ADDU;
        end

    endcase
end

endmodule