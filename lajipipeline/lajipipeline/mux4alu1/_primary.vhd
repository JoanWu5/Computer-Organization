library verilog;
use verilog.vl_types.all;
entity mux4alu1 is
    port(
        d0              : in     vl_logic_vector(31 downto 0);
        d1              : in     vl_logic_vector(31 downto 0);
        d2              : in     vl_logic_vector(31 downto 0);
        s               : in     vl_logic_vector(1 downto 0);
        y               : out    vl_logic_vector(31 downto 0)
    );
end mux4alu1;
