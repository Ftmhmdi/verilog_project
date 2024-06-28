library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        operation       : in     vl_logic_vector(1 downto 0);
        A               : in     vl_logic_vector(511 downto 0);
        B               : in     vl_logic_vector(511 downto 0);
        C               : out    vl_logic_vector(511 downto 0);
        D               : out    vl_logic_vector(511 downto 0)
    );
end alu;
