<Cabbage>
form caption("perhelio") size(400, 600), guiMode("queue"), pluginId("def1"), colour(150,180,180), bundle("resources/")

;csound console and surrounding deco
csoundoutput bounds(0, 20, 400, 100) channel("csoundoutput10000") colour(150,180,180) fontColour("black")
image bounds(10, 10, 378, 1) colour("black") ;line above
image bounds(10, 122, 378, 1) colour("black") ;line belowdrop

listbox bounds(10, 146, 60, 90) channel("wavA_drop") colour(150,180,180) fontColour("black") channelType("string")
button bounds(10, 124, 60, 20) channel("wavA_pop") colour:0(150, 180,180) text("populate") latched(0) fontColour("black")

listbox bounds(290, 146, 60, 90) channel("wavB_drop") colour(150,180,180) fontColour("black") channelType("string")
button bounds(290, 124, 60, 20) channel("wavB_pop") colour:0(150, 180,180) text("populate") latched(0) fontColour("black")

filebutton bounds(300,524, 90, 30) channel("0_file") colour:0(150,180,180) fontColour("black") text("file out")
texteditor bounds(0, 554, 400, 30) colour(150,180,180) fontColour("black") channel("0_file_text") readonly(1)
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

kbutton, kbuttontrig cabbageGetValue sprintf("%spop", Schanpre)
if kbutton==1 then
scoreline sprintf("i 18 0 0 \"%s\"", Schanpre), k(1)
endif

 endin
 
 instr 18 ;wav populate combobox
 
Schanpre = p4
/* the resourcesBox opcode populates a selected 
 Cabbage combobox with files from ./resources/ */
ires, Slist[] resourcesBox "wav", sprintf("%sdrop", Schanpre), 1

 endin

 instr 19
 Schanpre = p4
Schan1 strcat Schanpre, "file"
Schan2 strcat Schanpre, "file_text"
Sout resourcesFile Schan1, Schan2
 endin
 
</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
i17.1 0 -1 "wavA_"
i17.2 0 -1 "wavB_"

i19.1 0 -1 "0_"
f0 z
</CsScore>
</CsoundSynthesizer>
