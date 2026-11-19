-- Synchronous JK Flip-Flop Synthesized via Moore FSM (D = J*not(Q) + not(K)*Q)
-- Author: Tsikomia Scidelo ANDRIASAHY (ENSA Tangier - GSEA)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_flipflop_moore is
    Port (
        clk   : in  STD_LOGIC;
        rst_n : in  STD_LOGIC;
        J     : in  STD_LOGIC;
        K     : in  STD_LOGIC;
        Q     : out STD_LOGIC;
        Q_n   : out STD_LOGIC
    );
end jk_flipflop_moore;

architecture Structural_Moore of jk_flipflop_moore is
    signal q_int : STD_LOGIC := '0';
    signal d_in  : STD_LOGIC;
begin
    -- Next-state combinational synthesis: D = (J AND NOT Q) OR (NOT K AND Q)
    d_in <= (J and (not q_int)) or ((not K) and q_int);

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            q_int <= '0';
        elsif rising_edge(clk) then
            q_int <= d_in;
        end if;
    end process;

    Q   <= q_int;
    Q_n <= not q_int;
end Structural_Moore;
