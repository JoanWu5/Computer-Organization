library verilog;
use verilog.vl_types.all;
entity PcUnit is
    port(
        PC              : out    vl_logic_vector(31 downto 0);
        PcReSet         : in     vl_logic;
        PcSel           : in     vl_logic;
        Jump            : in     vl_logic;
        JumpAddr        : in     vl_logic_vector(25 downto 0);
        Clk             : in     vl_logic;
        Adress          : in     vl_logic_vector(31 downto 0)
    );
end PcUnit;
