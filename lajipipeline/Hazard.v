
module Hazard(EXMEM_RegWrite,EXMEM_rd,IDEX_rs,IDEX_rt,MEMWB_RegWrite,MEMWB_rd,ForwardA,ForwardB,IDEX_MemRead,IFID_rs,IFID_rt,stallID,stallPC,flushIFID,flushIDEX,pcsel,jump,branch,compareSrc1,compareSrc2,IDEX_rd,IDEX_RegWrite,EXMEM_MemRead,EXMEM_rt);
	
	input		EXMEM_RegWrite;
	input		[4:0] EXMEM_rd;
	input  [4:0] MEMWB_rd;
	input  MEMWB_RegWrite;
	input		[4:0] IDEX_rs;
	input  [4:0] IDEX_rt;
	input  IDEX_MemRead;
	input  [4:0] IFID_rs;
	input  [4:0] IFID_rt;
	input  pcsel;
	input  jump;
	input  branch;
	input  EXMEM_MemRead;
	input  [4:0]EXMEM_rt;
	input  [4:0] IDEX_rd;
	input  IDEX_RegWrite;

  output reg [1:0] ForwardA;
	output reg [1:0] ForwardB;
	output reg stallID;
	output reg stallPC;
	output reg flushIFID;
	output reg flushIDEX;
	output reg compareSrc1;
	output reg compareSrc2;
	
	always@(*)
	begin
	//EX rd-rs
     if(EXMEM_RegWrite==1&&EXMEM_rd!=0&&EXMEM_rd==IDEX_rs)
    	    assign ForwardA=2;
	//MEM rd-rs
	   else if(MEMWB_RegWrite==1&&MEMWB_rd!=0&&MEMWB_rd==IDEX_rs)
	       assign ForwardA=1;
	   else
	       assign ForwardA=0;
	//EX rd-rt   
	   if(EXMEM_RegWrite==1&&EXMEM_rd!=0&&EXMEM_rd==IDEX_rt)
	       assign ForwardB=2;
	//MEM rd-rt
	   else if(MEMWB_RegWrite==1&&MEMWB_rd!=0&&MEMWB_rd==IDEX_rt)
	       assign ForwardB=1;
    	else
	       assign ForwardB=0;
	 //beq.bne       
	   if(branch==1&&EXMEM_RegWrite==1&&EXMEM_rd!=0&&EXMEM_rd==IFID_rs)
	      assign compareSrc1=1;
	   else
	      assign compareSrc1=0;
	   
	   if(branch==1&&EXMEM_RegWrite==1&&EXMEM_rd!=0&&EXMEM_rd==IFID_rt)
	       assign compareSrc2=1;
	   else
	      assign compareSrc2=0;
	   
	 //ID load stall 
	   if((IDEX_MemRead==1&&(IDEX_rt==IFID_rs||IDEX_rt==IFID_rt))||
	      (branch==1&& EXMEM_MemRead==1&&  (EXMEM_rt==IFID_rs||EXMEM_rt==IFID_rt)) ||
	      (branch==1&&IDEX_RegWrite==1&&IDEX_rd!=0&&(IDEX_rd==IFID_rs||IDEX_rd==IFID_rt)) )
	     begin
	       assign stallID=1;
	       assign stallPC=1;
	       assign flushIDEX=1;
	     end
	   else
	    begin
	       assign stallID=0;
	       assign stallPC=0;
	       assign flushIDEX=0;
	    end
	    
	   //jump flush
	   if(jump==1||pcsel==1)
	       assign flushIFID=1;
	   else
	       assign flushIFID=0;
	end
endmodule

