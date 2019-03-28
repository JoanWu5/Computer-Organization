library verilog;
use verilog.vl_types.all;
entity EXMEM is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ALUresult_in    : in     vl_logic_vector(31 downto 0);
        zero_in         : in     vl_logic;
        rt_in           : in     vl_logic_vector(31 downto 0);
        RegDst_in       : in     vl_logic;
        RegAddrI_in     : in     vl_logic_vector(4 downto 0);
        RegAddrR_in     : in     vl_logic_vector(4 downto 0);
        MemRead_in      : in     vl_logic;
        MemWrite_in     : in     vl_logic;
        RegWrite_in     : in     vl_logic;
        MemToReg_in     : in     vl_logic;
        ALUresult_out   : out    vl_logic_vector(31 downto 0);
        zero_out        : out    vl_logic;
        rt_out          : out    vl_logic_vector(31 downto 0);
        RegDst_out      : out    vl_logic;
        RegAddrI_out    : out    vl_logic_vector(4 downto 0);
        RegAddrR_out    : out    vl_logic_vector(4 downto 0);
        MemRead_out     : out    vl_logic;
        MemWrite_out    : out    vl_logic;
        RegWrite_out    : out    vl_logic;
        MemToReg_out    : out    vl_logic
    );
end EXMEM;
