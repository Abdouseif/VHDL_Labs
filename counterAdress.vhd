LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY counter IS

 PORT (clk : IN std_logic;
        rst:in std_logic;
	 address : out std_logic_vector(3 DOWNTO 0));
	 
END ENTITY counter;

ARCHITECTURE counterAdd OF counter IS  
signal counter :std_logic_vector(3 DOWNTO 0);
signal c : integer;
BEGIN

PROCESS(clk) IS  
BEGIN
    IF (rst='1') THEN counter<=(others =>'0');
    c<= 0;
    END IF;
    IF rising_edge(clk) THEN
    c<=c+1;
    IF (c=2) THEN 
    counter <= std_logic_vector((unsigned(counter)+1));
    c<=0;
    END IF;
    END IF;
END PROCESS;
   Address <=counter;   
END counterAdd;