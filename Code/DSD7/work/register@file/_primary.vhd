library verilog;
use verilog.vl_types.all;
entity registerFile is
    port(
        we              : in     vl_logic;
        clk             : in     vl_logic;
        index           : in     vl_logic_vector(3 downto 0);
        data_write      : in     vl_logic_vector(511 downto 0);
        data_read       : out    vl_logic_vector(511 downto 0);
        A               : out    vl_logic
    );
end registerFile;
