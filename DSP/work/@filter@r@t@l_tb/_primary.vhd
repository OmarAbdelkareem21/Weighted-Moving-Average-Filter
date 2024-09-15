library verilog;
use verilog.vl_types.all;
entity FilterRTL_tb is
    generic(
        RegWidth        : integer := 4;
        N               : integer := 8
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of RegWidth : constant is 1;
    attribute mti_svvh_generic_type of N : constant is 1;
end FilterRTL_tb;
