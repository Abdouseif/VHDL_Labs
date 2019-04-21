Library ieee;
use ieee.std_logic_1164.all;

entity Buf is 
GENERIC (n : integer := 16);
port(
inn : IN std_logic_vector (n-1 DOWNTO 0);
outt : out std_logic_vector(n-1 downto 0);
c : in std_logic);
end Buf;
Architecture myModel of Buf is


begin
outt<= inn when c='1' 
else (others=>'Z') when c='0';

end Architecture;
