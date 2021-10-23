
sr = 44100

ksmps = 32

nchnls = 2



zakinit 256, 256

gi_sin ftgen 0,0,16384,10,1
gi_cos ftgen 0,0,16384,11,1


#include "moleqqueu.orc"





instr 1120 ;write a set of 25 values from any f-table to any 25 consecutive zk-indexes for MOLEQQUEU

i_ftab = p4
i_wrzk = p5
iprint = p6

icount = 0

continue:
if (icount<25) then
ival table icount, i_ftab, 0
ires Mqu_Ktr_W_i ival, i_wrzk, icount, iprint
icount += 1
igoto continue
endif

endin




