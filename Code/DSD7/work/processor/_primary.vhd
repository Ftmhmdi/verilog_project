library verilog;
use verilog.vl_types.all;
entity processor is
    port(
        clk             : in     vl_logic;
        opcode          : in     vl_logic_vector(1 downto 0);
        entry1          : in     vl_logic_vector(9 downto 0);
        entry2          : in     vl_logic_vector(1 downto 0)
    );
end processor;
