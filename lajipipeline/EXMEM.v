
module EXMEM (clk, rst ,ALUresult_in,zero_in,rt_in,RegDst_in,RegAddrI_in,RegAddrR_in,MemRead_in,MemWrite_in,RegWrite_in,MemToReg_in,ALUresult_out,zero_out,rt_out,RegDst_out,RegAddrI_out,RegAddrR_out,MemRead_out,MemWrite_out,RegWrite_out,MemToReg_out);
               
   input         clk;
   input         rst;
   input  [31:0] ALUresult_in;
   input  zero_in;
   input  [31:0] rt_in;
   input  RegDst_in;
   input  [4:0] RegAddrI_in;
   input  [4:0] RegAddrR_in;
   input  MemRead_in;
   input  MemWrite_in;
   input  RegWrite_in;
   input  MemToReg_in;
   output [31:0] ALUresult_out;
   output zero_out;
   output [31:0] rt_out;
   output  RegDst_out;
   output [4:0] RegAddrI_out;
   output [4:0] RegAddrR_out;
   output MemRead_out;
   output MemWrite_out;
   output RegWrite_out;
   output MemToReg_out;
   
   reg [31:0] ALUresult;
   reg zero;
   reg [31:0] rt;
   reg RegDst;
   reg [4:0] RegAddrI;
   reg [4:0] RegAddrR;
   reg MemRead;
   reg MemWrite;
   reg RegWrite;
   reg MemToReg;
               
   always @(posedge clk or posedge rst) begin
      if ( rst ) 
        begin
            ALUresult <= 0;
            zero <= 0;
            rt<=0;
            RegDst<=0;
            RegAddrI <= 0;
            RegAddrR <= 0;
            MemRead <= 0;
            MemWrite <= 0;
            RegWrite <= 0;
            MemToReg <= 0;
        end
      else
        begin
           ALUresult <= ALUresult_in;
           zero <= zero_in;
           rt<=rt_in;
           RegDst<=RegDst_in;
           RegAddrI <= RegAddrI_in;
           RegAddrR <= RegAddrR_in;
           MemRead <= MemRead_in;
           MemWrite <= MemWrite_in;
           RegWrite <= RegWrite_in;
           MemToReg <= MemToReg_in;
        end
   end // end always
   assign ALUresult_out = ALUresult;
   assign zero_out = zero;
   assign rt_out = rt;
   assign RegDst_out=RegDst;
   assign RegAddrI_out = RegAddrI;
   assign RegAddrR_out = RegAddrR;
   assign MemRead_out = MemRead;
   assign MemWrite_out = MemWrite;
   assign RegWrite_out = RegWrite;
   assign MemToReg_out = MemToReg;
   
endmodule







