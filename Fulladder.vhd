Library ieee;
use ieee.std_logic_1164.all;

entity fulladder is 
GENERIC (n : integer := 16);
port(
A : IN std_logic_vector (n-1 DOWNTO 0);
B : IN std_logic_vector (n-1 DOWNTO 0);
Cin : in std_logic;
Cout : out std_logic;
s : out std_logic_vector (n-1 DOWNTO 0));

end entity;

Architecture myModel of fulladder is
COMPONENT bitadder IS
                  PORT( a,b,cin : IN std_logic; cout,s : OUT std_logic);
          END COMPONENT;
         SIGNAL temp : std_logic_vector(n-1 DOWNTO 0);

begin
f0: bitadder PORT MAP(a(0),b(0),cin,temp(0),s(0));
loop1: FOR i IN 1 TO n-1 GENERATE
        fx: bitadder PORT MAP(a(i),b(i),temp(i-1),temp(i),s(i));
END GENERATE;
Cout <= temp(n-1);

end Architecture;