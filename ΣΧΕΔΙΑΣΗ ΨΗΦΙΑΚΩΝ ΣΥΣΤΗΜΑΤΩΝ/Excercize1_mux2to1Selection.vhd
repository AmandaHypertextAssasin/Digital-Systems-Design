library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
  port(
	d0,d1,selection: in std_logic;
        y: out std_logic 
);
end mux2to1;

architecture behaviour of mux2to1 is
	begin
  	process (d0,d1,selection)
  	begin
		if (selection ='0') then 
	   	y <= d0;
		else
	        y <= d1;
		end if;
  	end process;
end behaviour;




