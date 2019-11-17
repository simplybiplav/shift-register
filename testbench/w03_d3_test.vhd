library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity slr8bits_test is 
end  slr8bits_test;

architecture behavior of slr8bits_test is
constant CLK_PERIOD : time := 10 ns;

COMPONENT  slr8bits 
Port ( clk, rst: in std_logic;
                 sin: in std_logic;
--change 2 , add parallel input load
                 load: in std_logic;
                 din: in std_logic_vector(7 downto 0);
--change 3 , add shift port for left/right
                 shft: in std_logic;
                 dout: out std_logic_vector (7 downto 0)
                );
END COMPONENT;

signal clk, rst: std_logic;
signal                 sin: std_logic;
signal                 load: std_logic;
signal                 din: std_logic_vector(7 downto 0);
signal                shft: std_logic;
signal                  dout: std_logic_vector (7 downto 0) := (others => '0');

BEGIN
--Instantiate in uut
uut:slr8bits port map(
clk=>clk, rst=>rst, sin=>sin, load=>load, din=>din,shft=>shft, dout=>dout
);

clk_process:process
begin
    clk <= '0' ;
    wait for CLK_PERIOD/2;
    clk <= '1' ;
    wait for CLK_PERIOD/2;
end process;

io_process: process
begin
    rst <= '0';
    shft <= '0';
    sin <= '1';
    load <= '1';
    din <= "00001000";
    wait for CLK_PERIOD;
    
    load <= '0';
    shft <= '0';
    wait for CLK_PERIOD * 2;

    shft <= '1';
    wait for CLK_PERIOD * 2;
    
    load <= '1';
    din <= "01000000";
    wait for CLK_PERIOD;

    load <= '0';
    sin <= '0';

    shft <= '1';
    wait for CLK_PERIOD * 2;

    shft <= '0';
    wait for CLK_PERIOD * 2;

    rst <= '1';
    wait for CLK_PERIOD * 2;
    
end process;

END;
