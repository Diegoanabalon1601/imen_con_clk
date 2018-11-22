library IEEE;
use ieee.std_logic_1164.all;              
use ieee.std_logic_unsigned.all;          
use std.textio.all; 

entity imen_con_reloj is
	generic(fname : string  := "data.txt"); 
    port(
	      clk: in std_logic;
	      addr : in std_logic_vector(31 downto 0);
	      rd : out std_logic_vector(31 downto 0));
end imen_con_reloj;

architecture Behavioral of imen_con_reloj is

    type RamType is array(0 to 1024) of bit_vector(31 downto 0);    

    impure function InitRamFromFile (RamFileName : in string) return RamType is
        FILE RamFile         : text is in RamFileName;                       
        variable RamFileLine : line;                                 
        variable RAM         : RamType;
	variable I           : integer;                                   
    begin 
        I := 0;                                                  
        while (not endfile(RamFile)) loop                                  
            readline (RamFile, RamFileLine);                             
            read (RamFileLine, RAM(I));                                  
            I := I + 1;                                                  
        end loop;                                                    
        return RAM;                                                  
    end function;                                                

    signal RAM : RamType := InitRamFromFile(fname);
    
begin

   process(clk)
	begin
   if rising_edge(clk) then
		
		rd <= to_stdlogicvector(RAM(conv_integer(addr)));
	
	end if;
	end process;
	
	
				

end Behavioral;

