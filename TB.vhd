LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;
ENTITY TB IS
	 
END ENTITY TB;

ARCHITECTURE TB1 OF TB IS  
 COMPONENT counter IS
          PORT( clk : in std_logic;
                rst:in std_logic;
	        address : out std_logic_vector(3 DOWNTO 0));
             
 END COMPONENT;
signal caddress :std_logic_vector(3 DOWNTO 0);
signal clk :std_logic ;
signal rst: std_logic;

BEGIN
label11: counter PORT MAP (clk,rst,caddress);
process
begin 
clk <= '1';
wait for 5ns ;
clk <= '0'; 
wait for  5ns ;
end process ;

process 
begin 
wait for  2ns ;
rst<='1';
wait for 10ns;
Assert(caddress="0000") report " ENTA GHABY0 " severity error ;
rst<='0';
wait for 30ns;
Assert(caddress="0001") report " ENTA GHABY1 " severity error ;
wait for 30ns;
Assert(caddress="0010") report " ENTA GHABY2" severity error ;
wait for 30ns;
Assert(caddress="0011") report " ENTA GHABY3 " severity error ;
wait for 30ns;
Assert(caddress="0100") report " ENTA GHABY4 " severity error ;
wait for 30ns;
Assert(caddress="0101") report " ENTA GHABY5 " severity error ;
wait for 30ns;
Assert(caddress="0110") report " ENTA GHABY6 " severity error ;
wait for 30ns;
Assert(caddress="0111") report " ENTA GHABY7 " severity error ;
wait for 30ns;
Assert(caddress="1000") report " ENTA GHABY8 " severity error ;
wait for 30ns;
Assert(caddress="1001") report " ENTA GHABY9 " severity error ;
wait for 30ns;
Assert(caddress="1010") report " ENTA GHABY10 " severity error ;
wait for 30ns;
Assert(caddress="1011") report " ENTA GHABY11 " severity error ;
wait for 30ns;
Assert(caddress="1100") report " ENTA GHABY12 " severity error ;
wait for 30ns;
Assert(caddress="1101") report " ENTA GHABY13 " severity error ;
wait for 30ns;
Assert(caddress="1110") report " ENTA GHABY14 " severity error ;
wait for 30ns;
Assert(caddress="1111") report " ENTA GHABY15 " severity error ;
wait for 30ns;
Assert(caddress="0000") report " ENTA GHABY16 " severity error ;
wait;
end process ;
END TB1;
