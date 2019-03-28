
module PcUnit(PC,OldPC,stall,PcReSet,PcSel,Clk,Adress,Adj,j);

  input   [31:0] OldPC;
  input   stall;
	input   PcReSet;
	input   PcSel;
	input   Clk;
	input   [31:0] Adress;
	input   [25:0] Adj;
	input   j;
	
	output reg[31:0] PC;
	integer i;
	reg [31:0] temp;
	always@(posedge Clk or posedge PcReSet)
	begin
		if(PcReSet == 1)
			PC <= 32'h0000_3000;
		if(stall==0)
		  begin	
		  PC=PC+4;    
	      if(PcSel == 1)
				 begin
					 for(i=0;i<30;i=i+1)
						 temp[31-i] = Adress[29-i];
					 temp[0] = 0;
					 temp[1] = 0;
					
					 PC = OldPC+temp;
				   end
		    if(j==1)
				   begin
				     PC={OldPC[31:28],Adj[25:0],2'b00};
			    	end
		  end
	end
endmodule
	
	