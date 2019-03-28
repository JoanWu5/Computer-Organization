library verilog;
use verilog.vl_types.all;
entity MEMWB is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ALUresult_in    : in     vl_logic_vector(31 downto 0);
        mem_in          : in     vl_logic_vector(31 downto 0);
        RegDst_in       : in     vl_logic;
        RegAddrI_in     : in     vl_logic_vector(4 downto 0);
        RegAddrR_in     : in     vl_logic_vector(4 downto 0);
        RegWrite_in     : in     vl_logic;
        MemToReg_in     : in     vl_logic;
        ALUresult_out   : out    vl_logic_vector(31 downto 0);
        mem_out         : out    vl_logic_vector(31 downto 0);
        RegDst_out      : out    vl_logic;
        RegAddrI_out    : out    vl_logic_vector(4 downto 0);
        RegAddrR_out    : out    vl_logic_vector(4 downto 0);
        RegWrite_out    : out    vl_logic;
        MemToReg_out    : out    vl_logic
    );
end MEMWB;
