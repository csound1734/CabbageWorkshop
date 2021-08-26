<Cabbage>
form caption("perhelio") size(400, 600), guiMode("queue"), pluginId("def1"), colour(150,180,180), bundle("resources/")

;csound console and surrounding deco
csoundoutput bounds(0, 20, 400, 100) channel("csoundoutput10000") colour(150,180,180) fontColour("black")
image bounds(10, 10, 378, 1) colour("black") ;line above
image bounds(10, 122, 378, 1) colour("black") ;line below


combobox bounds(10, 124, 60, 20) channel("wavA_DD") colour(150,180,180) fontColour("black")
button bounds(10, 146, 60, 20) channel("wavA_DDpop") colour:0(150, 180,180) text("populate") latched(0) fontColour("black")

combobox bounds(100, 124, 60, 20) channel("wavB_DD") colour(150,180,180) fontColour("black")
button bounds(100, 146, 60, 20) channel("wavB_DDpop") colour:0(150, 180,180) text("populate") latched(0) fontColour("black")

combobox bounds(200, 124, 60, 20) channel("wavC_DD") colour(150,180,180) fontColour("black")
button bounds(200, 146, 60, 20) channel("wavC_DDpop") colour:0(150, 180,180) text("populate") latched(0) fontColour("black")

combobox bounds(300, 124, 60, 20) channel("wavD_DD") colour(150,180,180) fontColour("black")
button bounds(300, 146, 60, 20) channel("wavD_DDpop") colour:0(150, 180,180) text("populate") latched(0) fontColour("black")
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
 
Schanpre = p4

kbutton, kbuttontrig cabbageGetValue sprintf("%sDDpop", Schanpre)
if kbutton==1 then
scoreline sprintf("i 18 0 0 \"%s\"", Schanpre), k(1)
endif

 endin
 
 instr 18 ;wav populate combobox
 
Schanpre = p4
/* the resourcesBox opcode populates a selected 
 Cabbage combobox with files from ./resources/ */
ires, Slist[] resourcesBox "wav", sprintf("%sDD", Schanpre), 1
 
 endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
i17.1 0 -1 "wavA_"
i17.2 0 -1 "wavB_"
i17.3 0 -1 "wavC_"
i17.4 0 -1 "wavD_"

f0 z
</CsScore>
</CsoundSynthesizer>
