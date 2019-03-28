library verilog;
use verilog.vl_types.all;
entity mux2compare2 is
    port(
        d0              : in     vl_logic_vector(31 downto 0);
        d1              : in     vl_logic_vector(31 downto 0);
        s               : in     vl_logic;
        y               : out    vl_logic_vector(31 downto 0)
    );
end mux2compare2;
