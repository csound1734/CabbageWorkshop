<Cabbage>
form caption("perhelio") size(400, 600), guiMode("queue"), pluginId("def1"), colour(150,180,180), bundle("resources/")

;csound console and surrounding deco
csoundoutput bounds(0, 20, 400, 100) channel("csoundoutput10000") colour(150,180,180) fontColour("black")
image bounds(10, 10, 378, 1) colour("black") ;line above
image bounds(10, 122, 378, 1) colour("black") ;line below


combobox bounds(10, 124, 80, 20) channel("wavDD") colour(150,180,180) fontColour("black")
button bounds(10, 146, 80, 20) channel("wavDDpop") colour:0(150, 180,180) text("populate") latched(0) fontColour("black")

combobox bounds(160, 124, 80, 20) channel("orcDD") colour(150,180,180) fontColour("black")
button bounds(160, 146, 80, 20) channel("orcDDpop") colour:0(150, 180,180) text("populate") latched(0) fontColour("black")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
;-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

#include "resources/resources.orc"
 
 instr 17
 
Sext = p4
kbutton, kbuttontrig cabbageGetValue sprintf("%sDDpop", Sext)
if kbutton==1 then
scoreline sprintf("i 18 0 0 \"%s\"", Sext), k(1)
endif

 endin
 
 instr 18
 
Sext = p4
/* the resourcesBox opcode populates a selected 
 Cabbage combobox with files from ./resources/ */
ires, Slist[] resourcesBox Sext, sprintf("%sDD", Sext), 1
 
 endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
i17.1 0 -1 "wav"
i17.2 0 -1 "orc"
f0 z
</CsScore>
</CsoundSynthesizer>
