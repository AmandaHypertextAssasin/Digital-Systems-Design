library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY mux2_1 IS
	GENERIC(delay: TIME := 20 ns);
	PORT(a, b, s: IN BIT;
		z : OUT BIT);
END; -- entity this is a comment

--
-- Architecture behave of mux2_1 - behavioural (sequential) style
--

ARCHITECTURE behave OF mux2_1 IS
-- declarations
BEGIN

PROCESS(a,b,s)
BEGIN
	IF s = '0' THEN
		z <= a AFTER delay;
	ELSE -- s='1' 
		z <= b AFTER delay;
	END IF;

END PROCESS;
END; -- architecture behave


--
--Architecture dataflow of mux2_1 is using dataflow style

ARCHITECTURE dataflow OF mux2_1 IS
BEGIN
z <= (NOT s AND a) OR (s AND b) AFTER delay; -- another description of the multiplexer
END;-- ARCHITECTURE dataflow


--
--Architecture struct of mux2_1 is using structural style
--

USE WORK.components.ALL; 
--in order to avoid component declarations in --architecture

ARCHITECTURE struct OF mux2_1 IS
	
	SIGNAL sn, asn, sb: BIT;
BEGIN
	inv1: invgate PORT MAP(X => s, F => sn);
	and1: and2gate PORT MAP(X => a, Y => sn, F => asn);
	and2: and2gate PORT MAP( X => s, Y => b, F => sb);
	or1: or2gate PORT MAP(X => asn, Y => sb, F => z);

END; -- architecture struct

