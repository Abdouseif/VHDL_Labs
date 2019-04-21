
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;



ENTITY genout IS

 PORT ( clk : IN std_logic;
        rst:in std_logic;
        modd:in std_logic;
        input: in std_logic_vector (4 DOWNTO 0);
        keylength: in std_logic_vector(4 DOWNTO 0);
        AddresstoRAM: out std_logic_vector(4 downto 0);
        outfromRAM: in std_logic_vector(4 downto 0);
        output: out std_logic_vector(4 downto 0)
       );
	 
END ENTITY genout;

ARCHITECTURE gen OF genout IS  
signal counter : integer;
signal key: std_logic_vector(4 downto 0);
BEGIN

key<=outfromRAM;
PROCESS(clk) IS  
BEGIN
    IF (rst='1') THEN counter<= 0;
    output<=(others => '0');
    END IF;
    
    IF rising_edge(clk) THEN
    
    IF (modd='1') THEN 
    counter<=counter+1;
    AddresstoRAM<=std_logic_vector(to_unsigned((counter mod (to_integer(unsigned(keylength)))),5));
    output<=std_logic_vector(to_unsigned((to_integer(unsigned(input))+to_integer(unsigned(key))mod(28)),5));
    
    END IF;
    IF (modd='0') THEN 
    counter<=0;
    output<=(others => '0');
    END IF;

    END IF;
      

END PROCESS;
   
END gen;