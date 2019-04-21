Library ieee;
use ieee.std_logic_1164.all;

entity partb is 

port(
a : in std_logic_vector(15 downto 0) ;
b : in std_logic_vector(15 downto 0);
s0: in std_logic;
s1: in std_logic;
f : out std_logic_vector(15 downto 0));

end entity;

Architecture myModel of partb is
begin
f<= a and b when s1='0' and s0='0'
else a or b when s1='0' and s0='1'
else a xor b when s1='1' and s0='0'
else  not a when s1='1' and s0='1';
end Architecture;
