library verilog;
use verilog.vl_types.all;
entity PcUnit is
    port(
        PC              : out    vl_logic_vector(31 downto 0);
        OldPC           : in     vl_logic_vector(31 downto 0);
        stall           : in     vl_logic;
        PcReSet         : in     vl_logic;
        PcSel           : in     vl_logic;
        Clk             : in     vl_logic;
        Adress          : in     vl_logic_vector(31 downto 0);
        Adj             : in     vl_logic_vector(25 downto 0);
        j               : in     vl_logic
    );
end PcUnit;
