<Cabbage>
form caption("main") size(1150, 400), guiMode("queue"), pluginId("def1"), colour(150,180,180), bundle("resources/")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

#include "resources/resources.orc"

;instrument will be triggered by keyboard widget
instr 1
i_width chnget "SCREEN_WIDTH"
i_height chnget "SCREEN_HEIGHT"
Stheme1 = "(150,180,180)"
Sdefile = "resources/r.wav"
cabbageCreate "soundfiler", sprintf("bounds(0,0,%d,%d), file(%s) colour(0,0,0) tableBackgroundColour%s",i_width,i_height*(2/13), Sdefile, Stheme1)
cabbageCreate "label", sprintf("bounds(0,0,400,20) fontColour(0,0,0) text(\"%s\")", Sdefile)
cabbageCreate "label", sprintf("bounds(%d,%d,%d,20), text(\"import IR\") fontColour(0,0,0)", i_width*(7/8), i_height*(2/13), i_width*(1/8))
cabbageCreate "label", sprintf("bounds(%d,%d,%d,20), text(\"IR (impulse response)\") fontColour(0,0,0)", i_width*(3/4), i_height*(2/13), i_width*(1/8))
cabbageCreate "encoder", sprintf("bounds(%d,%d,64,64), text(\"pitch\") range(-10,10,0,1,0.01) colour(0,0,0) trackerColour%s fontColour(0,0,0) outlineColour(0,0,0)", i_width*(3/4)+64, i_height*(2/13)+40, Stheme1)
cabbageCreate "nslider", sprintf("bounds(%d,%d,64,32), text(\"pitch\") range(-100,100,0,1,1) colour%s fontColour(0,0,0) textBoxOutlineColour(0,0,0) textBoxOutlineThickness(4)", i_width*(3/4), i_height*(2/13)+40, Stheme1)
cabbageCreate "listbox", sprintf("bounds(%d,%d,64,74) colour%s fontColour(0,0,0)", i_width*(7/8)+40, i_height*(2/13)+20, Stheme1)
cabbageCreate "button", sprintf("bounds(%d,%d,64,20), text(\"populate\") colour:0%s fontColour(0,0,0) latched(0)", i_width*(7/8)+40, i_height*(2/13)+94, Stheme1)
cabbageCreate "encoder", sprintf("bounds(%d,%d,64,64), text(\"pitch\") range(-10,10,0,1,0.01) colour(0,0,0) trackerColour%s fontColour(0,0,0) outlineColour(0,0,0)", i_width*(7/8)+64, i_height*(2/13)+140, Stheme1)
cabbageCreate "nslider", sprintf("bounds(%d,%d,64,32), text(\"pitch\") range(-100,100,0,1,1) colour%s fontColour(0,0,0) textBoxOutlineColour(0,0,0) textBoxOutlineThickness(4)", i_width*(7/8), i_height*(2/13)+140, Stheme1)
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
i1 0 0
f0 z
</CsScore>
</CsoundSynthesizer>
