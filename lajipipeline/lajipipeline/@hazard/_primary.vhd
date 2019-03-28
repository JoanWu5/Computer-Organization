library verilog;
use verilog.vl_types.all;
entity Hazard is
    port(
        EXMEM_RegWrite  : in     vl_logic;
        EXMEM_rd        : in     vl_logic_vector(4 downto 0);
        IDEX_rs         : in     vl_logic_vector(4 downto 0);
        IDEX_rt         : in     vl_logic_vector(4 downto 0);
        MEMWB_RegWrite  : in     vl_logic;
        MEMWB_rd        : in     vl_logic_vector(4 downto 0);
        ForwardA        : out    vl_logic_vector(1 downto 0);
        ForwardB        : out    vl_logic_vector(1 downto 0);
        IDEX_MemRead    : in     vl_logic;
        IFID_rs         : in     vl_logic_vector(4 downto 0);
        IFID_rt         : in     vl_logic_vector(4 downto 0);
        stallID         : out    vl_logic;
        stallPC         : out    vl_logic;
        flushIFID       : out    vl_logic;
        flushIDEX       : out    vl_logic;
        pcsel           : in     vl_logic;
        jump            : in     vl_logic;
        branch          : in     vl_logic;
        compareSrc1     : out    vl_logic;
        compareSrc2     : out    vl_logic;
        IDEX_rd         : in     vl_logic_vector(4 downto 0);
        IDEX_RegWrite   : in     vl_logic;
        EXMEM_MemRead   : in     vl_logic;
        EXMEM_rt        : in     vl_logic_vector(4 downto 0)
    );
end Hazard;
