<Cabbage>
form caption("Untitled") size(200, 500), guiMode("queue"), pluginId("def1")
;keyboard bounds(8, 108, 1081, 185) keyWidth(100)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 8
nchnls = 2
0dbfs = 1

;instrument will be triggered by keyboard widget
instr 17
Schan = "tweak"
Scode sprintf "bounds(20,220,160,160) colour(80,80,80) trackerColour(0,0,255) channel(\"%s\")", Schan
cabbageCreate "encoder", Scode
endin

instr 18
kstatus init 0
Schan = "tweak"
kinp chnget Schan
kinp port kinp, 4/kr
kinp_c changed2 kinp
kinp_c port kinp_c, 1/kr
if (kinp_c==0) then
if (kstatus==1) then
event "i", 33, 0, .01, 1
endif
kstatus = 0
endif
if (kinp_c!=0)&&(kstatus==0) then
event "i", 33, 0, -1, 0
kstatus = 1
endif
endin

instr 33
xtratim 2
Schan = "tweak"
icps = cpspch(5.09)
kchan chnget Schan
kchan port kchan, 0.005
kamp init 1
kdt jitter .125, .03, 1.3
ares squinewave a(icps)*semitone(kdt-.1), a(0), a(-0.91), a(0), 9, -1
ares2 squinewave a(icps)*semitone(-kdt+.1), a(0), a(-0.92), a(0),11, -1
ares3 squinewave a(icps)*semitone(kdt), a(0), a(-0.93), a(0), 13, -1
ares4 squinewave a(icps)*semitone(-kdt), a(0), a(-0.94), a(0), 17, -1
ares K35_lpf ares+ares2+ares3+ares4, tablei:k(kchan*4,64,0,0,0), 8.6, 0, 0, -1
;ares exciter ares, 150, 650, 8.0, -10
ares *= ampdbfs(-24)
kenv linsegr p4, .01, 1, 0.15, 0
ares *= kenv
outs ares, ares
endin

</CsInstruments>
<CsScore>
f11 0 16384 11 1

f64 0 4096 -8 64 2096 16384
;causes Csound to run for about 7000 years...
f0 z
i17 0 0
i18 0 z
</CsScore>
</CsoundSynthesizer>
