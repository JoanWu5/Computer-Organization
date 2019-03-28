module PcUnit(PC, PcReSet, PcSel, Jump, JumpAddr, Clk, Adress);

input PcReSet;
input PcSel;
input Jump;
input [25: 0] JumpAddr;
input Clk;
input [31: 0] Adress;

output reg[31: 0] PC;

integer i;
reg [31: 0] temp;
always@(posedge Clk or posedge PcReSet)
begin
    if (PcReSet == 1)
        PC <= 32'h0000_3000;

    PC = PC + 4;
    if (PcSel == 1)
    begin
        for (i = 0; i < 30; i = i + 1)
            temp[31 - i] = Adress[29 - i];
        temp[0] = 0;
        temp[1] = 0;

        PC = PC + temp;
    end

    if (Jump == 1)
    begin
        for (i = 0; i < 28; i = i + 1)
			PC[i] = 0;
        for (i = 0; i < 26; i = i + 1)
            PC[27 - i] = JumpAddr[25 - i];
    end
end

endmodule
