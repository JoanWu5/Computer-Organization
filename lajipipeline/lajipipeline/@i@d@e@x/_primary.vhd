library verilog;
use verilog.vl_types.all;
entity IDEX is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        flush           : in     vl_logic;
        instr_in        : in     vl_logic_vector(31 downto 0);
        extData_in      : in     vl_logic_vector(31 downto 0);
        data1_in        : in     vl_logic_vector(31 downto 0);
        data2_in        : in     vl_logic_vector(31 downto 0);
        RegAddrI_in     : in     vl_logic_vector(4 downto 0);
        RegAddrR_in     : in     vl_logic_vector(4 downto 0);
        RegDst_in       : in     vl_logic;
        ALUop_in        : in     vl_logic_vector(4 downto 0);
        ALUsrc_in       : in     vl_logic_vector(1 downto 0);
        MemRead_in      : in     vl_logic;
        MemWrite_in     : in     vl_logic;
        RegWrite_in     : in     vl_logic;
        MemToReg_in     : in     vl_logic;
        instr_out       : out    vl_logic_vector(31 downto 0);
        extData_out     : in     vl_logic_vector(31 downto 0);
        data1_out       : out    vl_logic_vector(31 downto 0);
        data2_out       : out    vl_logic_vector(31 downto 0);
        RegAddrI_out    : out    vl_logic_vector(4 downto 0);
        RegAddrR_out    : out    vl_logic_vector(4 downto 0);
        RegDst_out      : out    vl_logic;
        ALUop_out       : out    vl_logic_vector(4 downto 0);
        ALUsrc_out      : out    vl_logic_vector(1 downto 0);
        MemRead_out     : out    vl_logic;
        MemWrite_out    : out    vl_logic;
        RegWrite_out    : out    vl_logic;
        MemToReg_out    : out    vl_logic
    );
end IDEX;
