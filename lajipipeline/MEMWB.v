module MEMWB (clk, rst, ALUresult_in ,mem_in,RegDst_in,RegAddrI_in,RegAddrR_in,RegWrite_in,MemToReg_in,ALUresult_out,mem_out,RegDst_out,RegAddrI_out,RegAddrR_out,RegWrite_out,MemToReg_out);
               
   input         clk;
   input         rst;
   input  [31:0] ALUresult_in; 
   input  [31:0] mem_in;
   input  RegDst_in;
   input  [4:0]  RegAddrI_in;
   input  [4:0]  RegAddrR_in;
   input  RegWrite_in;
   input  MemToReg_in;
   output [31:0] ALUresult_out;
   output [31:0] mem_out;
   output  RegDst_out;
   output [4:0]  RegAddrI_out;
   output [4:0]  RegAddrR_out;
   output RegWrite_out;
   output MemToReg_out;
   
   reg [31:0] ALUresult;
   reg [31:0] mem;
   reg RegDst;
   reg [4:0]  RegAddrI;
   reg [4:0]  RegAddrR;
   reg RegWrite;
   reg MemToReg;
               
   always @(posedge clk or posedge rst) begin
      if ( rst ) 
        begin
            ALUresult<=0;
            mem<=0;
            RegDst<=0;
            RegAddrI<=0;
            RegAddrR<=0;
            RegWrite<=0;
            MemToReg<=0;
        end
      else
        begin
           ALUresult<=ALUresult_in;
           mem<=mem_in;
           RegDst<=RegDst_in;
           RegAddrI<=RegAddrI_in;
           RegAddrR<=RegAddrR_in;
           RegWrite<=RegWrite_in;
           MemToReg<=MemToReg_in;
        end
   end 
   assign ALUresult_out=ALUresult;
   assign mem_out=mem;
   assign RegDst_out=RegDst;
   assign RegAddrI_out=RegAddrI;
   assign RegAddrR_out=RegAddrR;
   assign RegWrite_out=RegWrite;
   assign MemToReg_out=MemToReg;
      
endmodule






