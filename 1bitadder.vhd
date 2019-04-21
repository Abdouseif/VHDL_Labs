Library ieee;
use ieee.std_logic_1164.all;

entity bitadder is 
GENERIC (n : integer := 8);
port(
A : in std_logic;
B : in std_logic;
Cin : in std_logic;
Cout : out std_logic;
s : out std_logic);

end entity;

Architecture myModel of bitadder is
begin
 s <= A XOR B XOR Cin;
Cout <= (A AND B) or (Cin AND (A XOR B));
end Architecture;
