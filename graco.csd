<Cabbage>
form caption("Untitled") size(400, 300), guiMode("queue"), pluginId("def1")
keyboard bounds(8, 158, 381, 95)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
;-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

gisrcL ftgen 0,0,0,1,"resources/r.wav",0,0,1
print cpspch(4.04)
;instrument will be triggered by keyboard widget
instr 20
icps = cpspch(5.07)
agran1 syncgrain db(-26), icps, 1, .9/icps, p4*(ftlen(gisrcL)/sr)/p3, gisrcL, 100, 1000
agran2 syncgrain db(-26), icps, -1, .9/icps, -p4*(ftlen(gisrcL)/sr)/p3, gisrcL, 100, 1000
ares tvconv agran1, agran2, 1, 1, 1, 16384
;ares tvconv ares, ares, 1, 1, 1, 2048
;ares = agran1
ares = tanh(ares)*.9
ares gain ares, 0.1
outs ares, ares
endin

</CsInstruments>
<CsScore>
f100 0 16384 -7 1 8192 1 8192 1
;causes Csound to run for about 7000 years...
;         	;pct ln	;	
i20 0 720 	.25
</CsScore>
</CsoundSynthesizer>
