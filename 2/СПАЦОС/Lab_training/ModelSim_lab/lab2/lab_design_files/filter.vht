-- Copyright (C) 1991-2005 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "03/02/2006 11:25:12"
                                                                        
-- Vhdl Self-Checking Test Bench (with test vectors) for design :       filter
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

LIBRARY STD;                                                            
USE STD.textio.ALL;                                                     

PACKAGE filter_vhd_tb_types IS
-- input port types                                                       
SUBTYPE i1_type IS STD_LOGIC;
SUBTYPE i2_type IS STD_LOGIC_VECTOR(7 DOWNTO 0);
SUBTYPE i3_type IS STD_LOGIC;
SUBTYPE i4_type IS STD_LOGIC;
-- output port types                                                      
SUBTYPE o1_type IS STD_LOGIC;
SUBTYPE o2_type IS STD_LOGIC_VECTOR(7 DOWNTO 0);
SUBTYPE o3_type IS STD_LOGIC;
-- output port names                                                     
CONSTANT o1_name : STRING (1 TO 3) := "nxt";
CONSTANT o2_name : STRING (1 TO 2) := "yn";
CONSTANT o3_name : STRING (1 TO 6) := "yvalid";
-- n(outputs)                                                            
CONSTANT o_num : INTEGER := 3;
-- mismatches vector type                                                
TYPE mmvec IS ARRAY (0 to (o_num - 1)) OF INTEGER;
-- exp o/ first change track vector type                                     
TYPE trackvec IS ARRAY (1 to o_num) OF BIT;
-- sampler type                                                            
SUBTYPE sample_type IS STD_LOGIC;                                          
-- utility functions                                                     
FUNCTION std_logic_to_char (a: STD_LOGIC) RETURN CHARACTER;              
FUNCTION std_logic_vector_to_string (a: STD_LOGIC_VECTOR) RETURN STRING; 
PROCEDURE write (l:INOUT LINE; value:IN STD_LOGIC; justified: IN SIDE:= RIGHT; field:IN WIDTH:=0);                                               
PROCEDURE write (l:INOUT LINE; value:IN STD_LOGIC_VECTOR; justified: IN SIDE:= RIGHT; field:IN WIDTH:=0);                                        
PROCEDURE throw_error(output_port_name: IN STRING; expected_value : IN STD_LOGIC; real_value : IN STD_LOGIC);                                   
PROCEDURE throw_error(output_port_name: IN STRING; expected_value : IN STD_LOGIC_VECTOR; real_value : IN STD_LOGIC_VECTOR);                     

END filter_vhd_tb_types;

PACKAGE BODY filter_vhd_tb_types IS
        FUNCTION std_logic_to_char (a: STD_LOGIC)  
                RETURN CHARACTER IS                
        BEGIN                                      
        CASE a IS                                  
         WHEN 'U' =>                               
          RETURN 'U';                              
         WHEN 'X' =>                               
          RETURN 'X';                              
         WHEN '0' =>                               
          RETURN '0';                              
         WHEN '1' =>                               
          RETURN '1';                              
         WHEN 'Z' =>                               
          RETURN 'Z';                              
         WHEN 'W' =>                               
          RETURN 'W';                              
         WHEN 'L' =>                               
          RETURN 'L';                              
         WHEN 'H' =>                               
          RETURN 'H';                              
         WHEN '-' =>                               
          RETURN 'D';                              
        END CASE;                                  
        END;                                       

        FUNCTION std_logic_vector_to_string (a: STD_LOGIC_VECTOR)       
                RETURN STRING IS                                        
        VARIABLE result : STRING(1 TO a'LENGTH);                        
        VARIABLE j : NATURAL := 1;                                      
        BEGIN                                                           
                FOR i IN a'RANGE LOOP                                   
                        result(j) := std_logic_to_char(a(i));           
                        j := j + 1;                                     
                END LOOP;                                               
                RETURN result;                                          
        END;                                                            

        PROCEDURE write (l:INOUT LINE; value:IN STD_LOGIC; justified: IN SIDE:=RIGHT; field:IN WIDTH:=0) IS 
        BEGIN                                                           
                write(L,std_logic_to_char(VALUE),JUSTIFIED,field);      
        END;                                                            
                                                                        
        PROCEDURE write (l:INOUT LINE; value:IN STD_LOGIC_VECTOR; justified: IN SIDE:= RIGHT; field:IN WIDTH:=0) IS                           
        BEGIN                                                               
                write(L,std_logic_vector_to_string(VALUE),JUSTIFIED,field); 
        END;                                                                

        PROCEDURE throw_error(output_port_name: IN STRING; expected_value : IN STD_LOGIC; real_value : IN STD_LOGIC) IS                               
        VARIABLE txt : LINE;                                              
        BEGIN                                                             
        write(txt,string'("ERROR! Vector Mismatch for output port "));  
        write(txt,output_port_name);                                      
        write(txt,string'(" :: @time = "));                             
        write(txt,NOW);                                                   
        write(txt,string'(", Expected value = "));                      
        write(txt,expected_value);                                        
        write(txt,string'(", Real value = "));                          
        write(txt,real_value);                                            
        writeline(output,txt);                                            
        END;                                                              

        PROCEDURE throw_error(output_port_name: IN STRING; expected_value : IN STD_LOGIC_VECTOR; real_value : IN STD_LOGIC_VECTOR) IS                 
        VARIABLE txt : LINE;                                              
        BEGIN                                                             
        write(txt,string'("ERROR! Vector Mismatch for output port "));  
        write(txt,output_port_name);                                      
        write(txt,string'(" :: @time = "));                             
        write(txt,NOW);                                                   
        write(txt,string'(", Expected value = "));                      
        write(txt,expected_value);                                        
        write(txt,string'(", Real value = "));                          
        write(txt,real_value);                                            
        writeline(output,txt);                                            
        END;                                                              

END filter_vhd_tb_types;

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

USE WORK.filter_vhd_tb_types.ALL;                                         

ENTITY filter_vhd_sample_tst IS
PORT (
	s1 : IN i1_type;
	s2 : IN i2_type;
	s3 : IN i3_type;
	s4 : IN i4_type;
	sampler : OUT sample_type
	);
END filter_vhd_sample_tst;

ARCHITECTURE sample_arch OF filter_vhd_sample_tst IS
SIGNAL clk : sample_type := '1';
BEGIN
t_prcs_sample : PROCESS ( s1 , s2 , s3 , s4 )
BEGIN
	IF (NOW > 0 ps) AND (NOW < 1000000 ps) THEN
		clk <= NOT clk ;
	END IF;
END PROCESS t_prcs_sample;
sampler <= clk;
END sample_arch;

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

LIBRARY STD;                                                            
USE STD.textio.ALL;                                                     

USE WORK.filter_vhd_tb_types.ALL;                                         

ENTITY filter_vhd_check_tst IS 
GENERIC (
	debug_tbench : BIT := '0'
);
PORT (
	o1 : IN o1_type;
	o2 : IN o2_type;
	o3 : IN o3_type;
	sampler : IN sample_type
);
END filter_vhd_check_tst;
ARCHITECTURE ovec_arch OF filter_vhd_check_tst IS
SIGNAL t_sig_o1_expected,t_sig_o1_expected_prev,t_sig_o1_prev : o1_type;
SIGNAL t_sig_o2_expected,t_sig_o2_expected_prev,t_sig_o2_prev : o2_type;
SIGNAL t_sig_o3_expected,t_sig_o3_expected_prev,t_sig_o3_prev : o3_type;

SIGNAL trigger : BIT := '0';
SIGNAL trigger_e : BIT := '0';
SIGNAL trigger_r : BIT := '0';
SIGNAL trigger_i : BIT := '0';
SIGNAL num_mismatches : mmvec := (OTHERS => 0);

BEGIN

-- Update history buffers  expected /o
t_prcs_update_o_expected_hist : PROCESS (trigger) 
BEGIN
	t_sig_o1_expected_prev <= t_sig_o1_expected;
	t_sig_o2_expected_prev <= t_sig_o2_expected;
	t_sig_o3_expected_prev <= t_sig_o3_expected;
END PROCESS t_prcs_update_o_expected_hist;


-- Update history buffers  real /o
t_prcs_update_o_real_hist : PROCESS (trigger) 
BEGIN
	t_sig_o1_prev <= o1;
	t_sig_o2_prev <= o2;
	t_sig_o3_prev <= o3;
END PROCESS t_prcs_update_o_real_hist;


-- expected yn[7]
t_prcs_yn_7: PROCESS
BEGIN
	t_sig_o2_expected(7) <= 'X';
WAIT;
END PROCESS t_prcs_yn_7;
-- expected yn[6]
t_prcs_yn_6: PROCESS
BEGIN
	t_sig_o2_expected(6) <= 'X';
WAIT;
END PROCESS t_prcs_yn_6;
-- expected yn[5]
t_prcs_yn_5: PROCESS
BEGIN
	t_sig_o2_expected(5) <= 'X';
WAIT;
END PROCESS t_prcs_yn_5;
-- expected yn[4]
t_prcs_yn_4: PROCESS
BEGIN
	t_sig_o2_expected(4) <= 'X';
WAIT;
END PROCESS t_prcs_yn_4;
-- expected yn[3]
t_prcs_yn_3: PROCESS
BEGIN
	t_sig_o2_expected(3) <= 'X';
WAIT;
END PROCESS t_prcs_yn_3;
-- expected yn[2]
t_prcs_yn_2: PROCESS
BEGIN
	t_sig_o2_expected(2) <= 'X';
WAIT;
END PROCESS t_prcs_yn_2;
-- expected yn[1]
t_prcs_yn_1: PROCESS
BEGIN
	t_sig_o2_expected(1) <= 'X';
WAIT;
END PROCESS t_prcs_yn_1;
-- expected yn[0]
t_prcs_yn_0: PROCESS
BEGIN
	t_sig_o2_expected(0) <= 'X';
WAIT;
END PROCESS t_prcs_yn_0;

-- expected nxt
t_prcs_nxt: PROCESS
BEGIN
	t_sig_o1_expected <= 'X';
WAIT;
END PROCESS t_prcs_nxt;

-- expected yvalid
t_prcs_yvalid: PROCESS
BEGIN
	t_sig_o3_expected <= 'X';
WAIT;
END PROCESS t_prcs_yvalid;

-- Set trigger on real/expected o/ pattern changes                        

t_prcs_trigger_e : PROCESS(t_sig_o1_expected,t_sig_o2_expected,t_sig_o3_expected)
BEGIN
	trigger_e <= NOT trigger_e;
END PROCESS t_prcs_trigger_e;

t_prcs_trigger_r : PROCESS(o1,o2,o3)
BEGIN
	trigger_r <= NOT trigger_r;
END PROCESS t_prcs_trigger_r;


t_prcs_selfcheck : PROCESS
VARIABLE i : INTEGER := 1;
VARIABLE txt : LINE;

VARIABLE last_o1_exp : o1_type := 'U';
VARIABLE last_o2_exp : o2_type := (OTHERS => 'U');
VARIABLE last_o3_exp : o3_type := 'U';

VARIABLE on_first_change : trackvec := "111";
BEGIN

WAIT UNTIL (sampler'LAST_VALUE = '1'OR sampler'LAST_VALUE = '0')
	AND sampler'EVENT;
IF (debug_tbench = '1') THEN
	write(txt,string'("Scanning pattern "));
	write(txt,i);
	writeline(output,txt);
	write(txt,string'("| expected "));write(txt,o1_name);write(txt,string'(" = "));write(txt,t_sig_o1_expected_prev);
	write(txt,string'("| expected "));write(txt,o2_name);write(txt,string'(" = "));write(txt,t_sig_o2_expected_prev);
	write(txt,string'("| expected "));write(txt,o3_name);write(txt,string'(" = "));write(txt,t_sig_o3_expected_prev);
	writeline(output,txt);
	write(txt,string'("| real "));write(txt,o1_name);write(txt,string'(" = "));write(txt,t_sig_o1_prev);
	write(txt,string'("| real "));write(txt,o2_name);write(txt,string'(" = "));write(txt,t_sig_o2_prev);
	write(txt,string'("| real "));write(txt,o3_name);write(txt,string'(" = "));write(txt,t_sig_o3_prev);
	writeline(output,txt);
	i := i + 1;
END IF;
IF ( t_sig_o1_expected_prev /= 'X' ) AND (t_sig_o1_expected_prev /= 'U' ) AND (t_sig_o1_prev /= t_sig_o1_expected_prev) AND (
	(t_sig_o1_expected_prev /= last_o1_exp) OR
	(on_first_change(1) = '1')
		) THEN
	throw_error("nxt",t_sig_o1_expected_prev,t_sig_o1_prev);
	num_mismatches(0) <= num_mismatches(0) + 1;
	on_first_change(1) := '0';
	last_o1_exp := t_sig_o1_expected_prev;
END IF;
IF ( t_sig_o2_expected_prev /= "XXXXXXXX" ) AND (t_sig_o2_expected_prev /= "UUUUUUUU" ) AND (t_sig_o2_prev /= t_sig_o2_expected_prev) AND (
	(t_sig_o2_expected_prev /= last_o2_exp) OR
	(on_first_change(2) = '1')
		) THEN
	throw_error("yn",t_sig_o2_expected_prev,t_sig_o2_prev);
	num_mismatches(1) <= num_mismatches(1) + 1;
	on_first_change(2) := '0';
	last_o2_exp := t_sig_o2_expected_prev;
END IF;
IF ( t_sig_o3_expected_prev /= 'X' ) AND (t_sig_o3_expected_prev /= 'U' ) AND (t_sig_o3_prev /= t_sig_o3_expected_prev) AND (
	(t_sig_o3_expected_prev /= last_o3_exp) OR
	(on_first_change(3) = '1')
		) THEN
	throw_error("yvalid",t_sig_o3_expected_prev,t_sig_o3_prev);
	num_mismatches(2) <= num_mismatches(2) + 1;
	on_first_change(3) := '0';
	last_o3_exp := t_sig_o3_expected_prev;
END IF;
    trigger_i <= NOT trigger_i;
END PROCESS t_prcs_selfcheck;


t_prcs_trigger_res : PROCESS(trigger_e,trigger_i,trigger_r)
BEGIN
	trigger <= trigger_i XOR trigger_e XOR trigger_r;
END PROCESS t_prcs_trigger_res;

t_prcs_endsim : PROCESS
VARIABLE txt : LINE;
VARIABLE total_mismatches : INTEGER := 0;
BEGIN
WAIT FOR 1000000 ps;
total_mismatches := num_mismatches(0) + num_mismatches(1) + num_mismatches(2);
IF (total_mismatches = 0) THEN                                              
        write(txt,string'("Simulation passed !"));                        
        writeline(output,txt);                                              
ELSE                                                                        
        write(txt,total_mismatches);                                        
        write(txt,string'(" mismatched vectors : Simulation failed !"));  
        writeline(output,txt);                                              
END IF;                                                                     
WAIT;
END PROCESS t_prcs_endsim;

END ovec_arch;

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

LIBRARY STD;                                                            
USE STD.textio.ALL;                                                     

USE WORK.filter_vhd_tb_types.ALL;                                         

ENTITY filter_vhd_vec_tst IS
END filter_vhd_vec_tst;
ARCHITECTURE filter_arch OF filter_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL t_sig_clk : STD_LOGIC;
SIGNAL t_sig_d : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL t_sig_newt : STD_LOGIC;
SIGNAL t_sig_nxt : STD_LOGIC;
SIGNAL t_sig_reset : STD_LOGIC;
SIGNAL t_sig_yn : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL t_sig_yvalid : STD_LOGIC;
SIGNAL t_sig_sampler : sample_type;

COMPONENT filter
	PORT (
	clk : IN STD_LOGIC;
	d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	newt : IN STD_LOGIC;
	nxt : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	yn : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	yvalid : OUT STD_LOGIC
	);
END COMPONENT;
COMPONENT filter_vhd_check_tst
PORT (
	o1 : IN o1_type;
	o2 : IN o2_type;
	o3 : IN o3_type;
	sampler : IN sample_type
);
END COMPONENT;
COMPONENT filter_vhd_sample_tst
PORT (
	s1 : IN i1_type;
	s2 : IN i2_type;
	s3 : IN i3_type;
	s4 : IN i4_type;
	sampler : OUT sample_type
	);
END COMPONENT;
BEGIN
	i1 : filter
	PORT MAP (
-- list connections between master ports and signals
	clk => t_sig_clk,
	d => t_sig_d,
	newt => t_sig_newt,
	nxt => t_sig_nxt,
	reset => t_sig_reset,
	yn => t_sig_yn,
	yvalid => t_sig_yvalid
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	t_sig_clk <= '0';
	WAIT FOR 10000 ps;
	t_sig_clk <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- reset
t_prcs_reset: PROCESS
BEGIN
	t_sig_reset <= '0';
	WAIT FOR 20000 ps;
	t_sig_reset <= '1';
	WAIT FOR 20000 ps;
	t_sig_reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- newt
t_prcs_newt: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		t_sig_newt <= '0';
		WAIT FOR 60000 ps;
		t_sig_newt <= '1';
		WAIT FOR 20000 ps;
	END LOOP;
	t_sig_newt <= '0';
WAIT;
END PROCESS t_prcs_newt;
-- d[7]
t_prcs_d_7: PROCESS
BEGIN
	t_sig_d(7) <= '0';
WAIT;
END PROCESS t_prcs_d_7;
-- d[6]
t_prcs_d_6: PROCESS
BEGIN
	t_sig_d(6) <= '0';
WAIT;
END PROCESS t_prcs_d_6;
-- d[5]
t_prcs_d_5: PROCESS
BEGIN
	t_sig_d(5) <= '0';
WAIT;
END PROCESS t_prcs_d_5;
-- d[4]
t_prcs_d_4: PROCESS
BEGIN
	t_sig_d(4) <= '1';
WAIT;
END PROCESS t_prcs_d_4;
-- d[3]
t_prcs_d_3: PROCESS
BEGIN
	t_sig_d(3) <= '0';
WAIT;
END PROCESS t_prcs_d_3;
-- d[2]
t_prcs_d_2: PROCESS
BEGIN
	t_sig_d(2) <= '0';
WAIT;
END PROCESS t_prcs_d_2;
-- d[1]
t_prcs_d_1: PROCESS
BEGIN
	t_sig_d(1) <= '0';
WAIT;
END PROCESS t_prcs_d_1;
-- d[0]
t_prcs_d_0: PROCESS
BEGIN
	t_sig_d(0) <= '0';
WAIT;
END PROCESS t_prcs_d_0;
tb_sample : filter_vhd_sample_tst
PORT MAP (
	s1 => t_sig_clk,
	s2 => t_sig_d,
	s3 => t_sig_newt,
	s4 => t_sig_reset,
	sampler => t_sig_sampler
	);

tb_out : filter_vhd_check_tst
PORT MAP (
	o1 => t_sig_nxt,
	o2 => t_sig_yn,
	o3 => t_sig_yvalid,
	sampler => t_sig_sampler
	);
END filter_arch;
