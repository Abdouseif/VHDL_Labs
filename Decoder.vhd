Library ieee;
use ieee.std_logic_1164.all;

entity Decoder is 
port(
inn : IN std_logic_vector (1 DOWNTO 0);
outt : out std_logic_vector(3 downto 0);
e : in std_logic);
end Decoder;
Architecture myModel of Decoder is


begin
outt<= "0001" when inn="00" and e='1'
else "0010" when inn="01" and e='1'
else "0100" when inn="10" and e='1'
else "1000" when inn="11" and e='1'
else "0000";

end Architecture;
