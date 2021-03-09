---------------------------------------------------------------------------------------------
--
--	Université de Sherbrooke 
--  Département de génie électrique et génie informatique
--
--	S4i - APP4 
--	
--
--	Auteurs: 		Marc-André Tétrault
--					Daniel Dalle
--					Sébastien Roy
-- 
---------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.MIPS32_package.all;


entity monitor_unicycle is
end monitor_unicycle;

architecture Behavioral of monitor_unicycle is

	signal show_alu_action			: alu_action_types;
	signal show_Instruction		: op_type;
	signal show_alu_unsupported	: std_ulogic;
	
	signal flag_syscall				: std_ulogic;
	
begin

	show_alu_unsupported	<= <<signal .mips_unicycle_tb.dut.inst_Datapath.inst_alu.d_unsupported : std_ulogic>>;
	show_alu_action 		<= f_DisplayAluAction(<<signal .mips_unicycle_tb.dut.inst_Datapath.inst_alu.i_alu_funct : std_ulogic_vector>>);


EncapsulerExtraction: block
	signal s_Instruction		: std_ulogic_vector (31 downto 0);
begin
	s_Instruction		<= <<signal .mips_unicycle_tb.dut.inst_Datapath.s_Instruction : std_ulogic_vector>>;
	show_Instruction	<= f_DisplayOp(s_Instruction);
end block;
	
flag_syscall <= '1' when show_Instruction = sim_OP_SYSCALL else '0';

end Behavioral;


