module IFID (clk, rst,flush,stall, pc_in ,instr_in, pc_out,instr_out);
               
   input         clk;
   input         rst;
   input         flush;
   input         stall;
   input  [31:0] pc_in; 
   input  [31:0] instr_in;
   output [31:0] pc_out;
   output [31:0] instr_out;
   
   reg [31:0] instr;
   reg [31:0] pc;
               
   always @(posedge clk or posedge rst) begin
      if ( rst ) 
        begin
            instr <= 0;
            pc <= 0;
        end    
      else if(stall==1)
        begin
           instr <= instr;
           pc<=pc;
        end
      else if(flush==1)
        instr <= 0;
      else
        begin
           instr <= instr_in;
           pc<=pc_in;
        end
        
   end 
   assign pc_out=pc;
   assign instr_out=instr;
      
endmodule

