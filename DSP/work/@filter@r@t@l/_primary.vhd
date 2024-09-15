library verilog;
use verilog.vl_types.all;
entity FilterRTL is
    generic(
        RegWidth        : integer := 4
    );
    port(
        Xn              : in     vl_logic_vector(7 downto 0);
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        Yn              : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of RegWidth : constant is 1;
end FilterRTL;
