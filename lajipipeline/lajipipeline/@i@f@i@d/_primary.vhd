library verilog;
use verilog.vl_types.all;
entity IFID is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        flush           : in     vl_logic;
        stall           : in     vl_logic;
        pc_in           : in     vl_logic_vector(31 downto 0);
        instr_in        : in     vl_logic_vector(31 downto 0);
        pc_out          : out    vl_logic_vector(31 downto 0);
        instr_out       : out    vl_logic_vector(31 downto 0)
    );
end IFID;
