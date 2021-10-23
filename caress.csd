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
event "i", 33, 0, 0, 1
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
kdt tablei kchan*16, 63, 0, 0, 1
klp tablei kchan,64,0,0,1
ares squinewave a(icps)*semitone(kdt), a(0), a(-0.91), a(0), 9, -1
ares2 squinewave a(icps)*semitone(-kdt), a(0), a(-0.92), a(0),11, -1
ares3 squinewave a(icps)*2, a(0.25), a(0.25), a(0), 13, -1
ares4 squinewave a(icps)*3, a(0.05), a(0.60), a(0.0), 5, -1
ares K35_hpf ares-ares2+(ares3-ares4)/4, klp, 9.750, 0,0, -1
ares exciter ares, icps*3, icps*100, 10, -10
ares diff ares
ares *= ampdbfs(-3)
kenv linsegr p4, .0625, 1, 0.10, 0
ares *= kenv
outs ares, ares
endin

</CsInstruments>
<CsScore>
f11 0 16384 11 1

f63 0 4097 -8 0.01 2048 0.030 1024 .12 1024 0.01
f64 0 4097 -5 64 2048 32768
;causes Csound to run for about 7000 years...
f0 z
i17 0 0
i18 0 z
</CsScore>
</CsoundSynthesizer>
