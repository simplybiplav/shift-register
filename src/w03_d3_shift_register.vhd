--Consider an 8-bit shift-left register and its corresponding VHDL description, 
--and assume that we want to expand it in order to support bidirectional shifting 
--and parallel load inputs.


---- USN VHDL 101 course
---- 8-bit shift-left register

--library ieee;
--use ieee.std_logic_1164.all;

--entity slr8bits is
--    Port ( clk, rst, sin: in std_logic;
--                 dout: out std_logic_vector (7 downto 0)
--                );
--end slr8bits;

--architecture arch of slr8bits is
--signal ffin, ffout: std_logic_vector (7 downto 0);
--begin
---- state register section
--process (clk, rst)
--        begin
--                if (rst = '1') then
--                        ffout <= (others => '0');
--                elsif rising_edge(clk) then
--                        ffout <= ffin;
--        end if;
--end process;
---- outputs section
--ffin <= ffout (6 downto 0) & sin;
--dout <= ffout;
--end arch;

 

--    Create a function table describing the operation of the expanded shift-register.
--    Expand the VHDL description presented to support the additional operating modes.
--    Prove the correctness of your solution by simulation in Vivado.



--                --------------------------------------------------------------------------------------------------------------------------
--                |clk       |  rst        |    load    |    shft    |  din[7:0]  |  sin       |   dout [7:0]                             |
--                |----------|-------------|------------|------------|------------|------------|------------------------------------------|   
--                |  0/1     |   0         |    0       |    x       |  x         |  x         |   dout                                   |
--                |----------|-------------|------------|------------|------------|------------|------------------------------------------|
--                |  x       |   1         |    x       |    x       |  x         |  x         |   "00000000"                             |
--                |----------|-------------|------------|------------|------------|------------|------------------------------------------|
--                |rising    |   0         |    1       |    x       |  din       |  x         |  din[7:0]                                |
--                |----------|-------------|------------|------------|------------|------------|------------------------------------------|
--                |rising    |   0         |    0       |    0       |   x        |   sin      |  dout[6:0],sin (left shift )             |
--                |----------|-------------|------------|------------|------------|------------|------------------------------------------|
--                |rising    |   0         |    0       |    1       |   x        |   sin      |  sin,dout[7:1]  (right shift)            |
--                |----------|-------------|------------|------------|------------|------------|------------------------------------------|





-- USN VHDL 101 course
-- 8-bit shift-left register

library ieee;
use ieee.std_logic_1164.all;

entity slr8bits is
--change 1 , remove sin
    Port ( clk, rst: in std_logic;
                 sin: in std_logic;
--change 2 , add parallel input load
                 load: in std_logic;
                 din: in std_logic_vector(7 downto 0);
--change 3 , add shift port for left/right
                 shft: in std_logic;
                 dout: out std_logic_vector (7 downto 0)
                );
end slr8bits;

-- architecture arch of slr8bits is
-- 
-- begin
-- -- state register section
-- process (clk, rst)
--         begin
--                 if (rst = '1') then
--                         dout <= (others => '0');
--                 elsif rising_edge(clk) then
--                        if shft='1' then
--                         dout <= din (6 downto 0) & '0';
--                        else
--                         dout <= '0' & din (7 downto 1);
--                        end if;
--                         
--         end if;
-- end process;
-- 
-- end arch;



architecture arch2 of slr8bits is

signal ffin : std_logic_vector(7 downto 0); 
signal ffout : std_logic_vector(7 downto 0);
begin
process (clk, rst)
    begin
        if(rst = '1' ) then
            ffout <= (others => '0');
        elsif rising_edge(clk) then
            ffout <= ffin;
        end if;
    end process;

ffin <= din when (load = '1' ) else
        ffout (6 downto 0) & sin when (shft = '0' ) else
        sin & ffout (7 downto 1) ;


dout <= ffout;

end arch2;
 
