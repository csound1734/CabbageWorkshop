<Cabbage>
form caption("GraCo Granular Convolution") size(450, 300), guiMode("queue"), pluginId("def1")

groupbox bounds(50,10,300,70) channel("osc") text("osc") 
groupbox bounds(50,80,150,200) channel("osc1") text("osc 1")
groupbox bounds(200,80,150,200) channel("osc2") text("osc 2")
groupbox bounds(360,10,80,270) channel("fx") text("fx") colour(64,64,64)

hslider bounds(0,20,150,20) channel("gain") parent("osc") range(-72,12,-6,1.0,0.1) trackerColour(0,0,0) text("gain")
hslider bounds(0,40,150,20) channel("prate") parent("osc") range(-4, 4, 0, 1, 0.01) text("rate")

rslider bounds(0,20,60,40) text("pitch") parent("osc1") channel("grpch1") range(0,8,1,0.5,0.001)
rslider bounds(0,65,60,40) text("dur ms") parent("osc1") channel("grdur1") range(1,2000,100,1.0,1)
rslider bounds(60,20,60,40) text("f mod") parent("osc1") channel("fmosc1") range(0,1,0,1.0,0.01)

rslider bounds(0,20,60,40) text("pitch") parent("osc2") channel("grpch2") range(-8,0,-1,0.5,0.001)
rslider bounds(0,65,60,40) text("dur ms") parent("osc2") channel("grdur2") range(1,2000,100,1.0,1)
rslider bounds(60,20,60,40) text("f mod") parent("osc2") channel("fmosc2") range(0,1,0,1.0,0.01)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

gisrcL ftgen 0,0,0,1,"resources/r.wav",0,0,1

;instrument will be triggered by keyboard widget
gkgain init 0

gkosc1_pch init 0
gkosc2_pch init 0

gkosc1_dur init 0
gkosc2_dur init 0

gkosc1_fmd init 0
gkosc2_fmd init 0

gkprate init 0

 instr 19 

gkgain chnget "gain"

gkosc1_pch chnget "grpch1"
gkosc2_pch chnget "grpch2"

gkosc1_dur chnget "grdur1"
gkosc2_dur chnget "grdur2"

gkosc1_fmd chnget "fmosc1"
gkosc2_fmd chnget "fmosc2"

gkprate chnget "prate"

 endin

 instr 20

icps = cpspch(5.07)

kfmod1 gauss gkosc1_fmd
kfmod2 gauss gkosc2_fmd

agran1 syncgrain db(gkgain), icps*semitone(kfmod1), gkosc1_pch, gkosc1_dur/1000, gkprate*(ftlen(gisrcL)/sr)/p3, gisrcL, 100, 1000
agran2 syncgrain db(gkgain), icps*semitone(kfmod2), gkosc2_pch, gkosc2_dur/1000, -gkprate*(ftlen(gisrcL)/sr)/p3, gisrcL, 100, 1000
agran1 dcblock agran1
agran2 dcblock agran2
ares tvconv agran1, agran2, 1, 1, 1, 1024
;ares tvconv ares, ares, 1, 1, 1, 2048
;ares = agran1
ares = tanh(ares)*.9

outs ares, ares

  endin


</CsInstruments>
<CsScore>
f 100 0 16384 -7 0 8192 1 8192 0
;causes Csound to run for about 7000 years...
f0 z
i19 0 z
i20 0 720
</CsScore>
</CsoundSynthesizer>
