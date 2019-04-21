Library ieee;
use ieee.std_logic_1164.all;

entity partd is 

port(
A : IN std_logic_vector (15 DOWNTO 0);
Cin : in std_logic;
S0: in std_logic;
S1: in std_logic;
Cout : out std_logic;
F : out std_logic_vector (15 DOWNTO 0));

end entity;

Architecture myModel of partd is
begin
F<= A(14 downto 0)&'0' when S0='0' AND S1='0'
else A(14 downto 0)& A(15) when S0='1' AND S1='0'
else A(14 downto 0)& Cin when S0='0' AND S1='1'
else x"0000";

Cout<= A(15);
end Architecture;
