--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:14:27 11/22/2018
-- Design Name:   
-- Module Name:   C:/Users/Intel Core i3/Desktop/UNI/6 SEMESTRE/ARQUITECTURA DE COMPUTADORES/instruction memory/imen/TB_imen_con_reloj.vhd
-- Project Name:  imen
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: imen_con_reloj
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_imen_con_reloj IS
END TB_imen_con_reloj;
 
ARCHITECTURE behavior OF TB_imen_con_reloj IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT imen_con_reloj
    PORT(
         clk : IN  std_logic;
         addr : IN  std_logic_vector(31 downto 0);
         rd : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal addr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal rd : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: imen_con_reloj PORT MAP (
          clk => clk,
          addr => addr,
          rd => rd
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
      addr <= x"00000004";
		
		wait for 3 ns;
		addr <= x"00000008";
		
		wait for 7 ns;
		addr <= x"0000000C";
      -- insert stimulus here 

      wait;
   end process;

END;
