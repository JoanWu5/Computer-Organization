
module IDEX (clk, rst,flush,instr_in,extData_in,data1_in,data2_in,RegAddrI_in,RegAddrR_in,RegDst_in,ALUop_in,ALUsrc_in,MemRead_in,MemWrite_in,RegWrite_in,MemToReg_in ,instr_out,extData_out,data1_out,data2_out,RegAddrI_out,RegAddrR_out,RegDst_out,ALUop_out,ALUsrc_out,MemRead_out,MemWrite_out,RegWrite_out,MemToReg_out);
               
   input         clk;
   input         rst;
   input         flush;
   input  [31:0] instr_in;
   input  [31:0] extData_in;
   input  [31:0] data1_in;
   input  [31:0] data2_in;
   input  [4:0] RegAddrI_in;
   input  [4:0] RegAddrR_in;
   input  RegDst_in;
   input  [4:0] ALUop_in;
   input  [1:0] ALUsrc_in;
   input  MemRead_in;
   input  MemWrite_in;
   input  RegWrite_in;
   input  MemToReg_in;
   output [31:0] instr_out;
   input  [31:0] extData_out;
   output [31:0] data1_out;
   output [31:0] data2_out;
   output [4:0] RegAddrI_out;
   output [4:0] RegAddrR_out;
   output RegDst_out;
   output [4:0] ALUop_out;
   output [1:0] ALUsrc_out;
   output MemRead_out;
   output MemWrite_out;
   output RegWrite_out;
   output MemToReg_out;
   
   reg [31:0] instr;
   reg [31:0] extData;
   reg [31:0] data1;
   reg [31:0] data2;
   reg [4:0] RegAddrI;
   reg [4:0] RegAddrR;
   reg RegDst;
   reg [4:0] ALUop;
   reg [1:0] ALUsrc;
   reg MemRead;
   reg MemWrite;
   reg RegWrite;
   reg MemToReg;
               
   always @(posedge clk or posedge rst) begin
      if ( rst ) 
        begin
            instr <= 0;
            extData <= 0;
            data1 <= 0;
            data2 <= 0;
            RegAddrI <= 0;
            RegAddrR <= 0;
            RegDst <= 0;
            ALUop <= 0;
            ALUsrc <= 0;
            MemRead <= 0;
            MemWrite <= 0;
            RegWrite <= 0;
            MemToReg <= 0;
        end
      else
        begin
          if(flush==0)
            begin
             instr <= instr_in;
             MemRead <= MemRead_in;
             MemWrite <= MemWrite_in;
             RegWrite <= RegWrite_in;
             MemToReg <= MemToReg_in;
           end
          else
            begin
            instr <=0;
             MemRead <= 0;
             MemWrite <= 0;
             RegWrite <= 0;
             MemToReg <= 0;
            end
           
           extData <= extData_in;
           data1 <= data1_in;
           data2 <= data2_in;
           RegAddrI <= RegAddrI_in;
           RegAddrR <= RegAddrR_in;
           RegDst <= RegDst_in;
           ALUop <= ALUop_in;
           ALUsrc <= ALUsrc_in;          
        end
   end 
   assign instr_out=instr;
   assign extData_out=extData;
   assign data1_out = data1;
   assign data2_out = data2;
   assign RegAddrI_out = RegAddrI;
   assign RegAddrR_out = RegAddrR;
   assign RegDst_out = RegDst;
   assign ALUop_out = ALUop;
   assign ALUsrc_out = ALUsrc;
   assign MemRead_out = MemRead;
   assign MemWrite_out = MemWrite;
   assign RegWrite_out = RegWrite;
   assign MemToReg_out = MemToReg;
   
endmodule






