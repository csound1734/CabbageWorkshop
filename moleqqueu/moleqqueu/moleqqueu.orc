 opcode "Mqu_Ktr_W", i, iik
i_ktrzk, i_N, k_sig xin ;i_ktrzk identifies an instance of moleqqueu using a zk-index
i_index = i_ktrzk+i_N
zkw k_sig, i_index  ;i_N is the index to the parameters to choose a specific param
xout 0
 endop

 opcode "Mqu_Ktr_W_i", i, iiio
i_ktrzk, i_N, i_sig, i_print xin ;i_ktrzk identifies an instance of moleqqueu using a zk-index
i_index = i_ktrzk+i_N
ziw i_sig, i_index  ;i_N is the index to the parameters to choose a specific param
printf_i "\n Now writing to zk space #%d : %f \n", i_print, i_index, i_sig
xout 0
 endop

 opcode "Mqu_Ktr_R", k, ii
i_ktrzk, i_N xin ;i_ktrzk identifies an instance of moleqqueu using a zk-index
i_index = i_ktrzk+i_N
k_sig zkr i_index  ;i_N is the index to the parameters to choose a specific param
xout k_sig
 endop

 opcode "Mqu_Ktr_R_i", i, iio
i_ktrzk, i_N, i_print xin ;i_ktrzk identifies an instance of moleqqueu using a zk-index
i_index = i_ktrzk+i_N
i_sig zir i_index  ;iN is the index to the parameters to choose a specific param
printf_i "\n Now read from zk space #%d : %f \n", i_print, i_index, i_sig
xout i_sig
 endop




instr 170 ;M_O_L_E_Q_Q_U_E_U



i_outza		= 	p4




i_ktrzk	=	p5  ;identifies an instance of moleqqueu using a unique zk-index

kdistribution 	zkr	i_ktrzk
kenv2amt	zkr	i_ktrzk+1
ksustain_amount	zkr	i_ktrzk+2
ka_d_ratio	zkr	i_ktrzk+3
kduration	zkr	i_ktrzk+4
kamp		zkr	i_ktrzk+5
kwavfreq	zkr	i_ktrzk+6
ksweepshape	zkr	i_ktrzk+7
kfmenv		zkr	i_ktrzk+8
ktraincps	zkr	i_ktrzk+9
knumpartials	zkr	i_ktrzk+10
kchroma		zkr	i_ktrzk+11
krandommask	zkr	i_ktrzk+12
kwaveform1	zkr	i_ktrzk+13
kwaveform2	zkr	i_ktrzk+14
kwaveform3	zkr	i_ktrzk+15
kwaveform4	zkr	i_ktrzk+16
ksamplepos1	zkr	i_ktrzk+17
ksamplepos2	zkr	i_ktrzk+18
ksamplepos3	zkr	i_ktrzk+19
ksamplepos4	zkr	i_ktrzk+20
kwavekey1	zkr	i_ktrzk+21
kwavekey2	zkr	i_ktrzk+22
kwavekey3	zkr	i_ktrzk+23
kwavekey4	zkr	i_ktrzk+24

agrainfreq = 0
async = 0
awavfm = 0

ienv2tab = p6
ienv_attack = p7
ienv_decay = p8

idisttab = p9
igainmasks = p10
iwavfreqstarttab = p11
iwavfreqendtab = p12
ifmamptab = p13
ichannelmasks = p14
iwaveamptab = p15

imax_grains = 10000

a1,a2,a3,a4,a5,a6,a7,a8 partikkel agrainfreq, \
              kdistribution, idisttab, async, kenv2amt, ienv2tab, ienv_attack, \
              ienv_decay, ksustain_amount, ka_d_ratio, kduration, kamp, igainmasks, \
              kwavfreq, ksweepshape, iwavfreqstarttab, iwavfreqendtab, awavfm, \
              ifmamptab, kfmenv, 18, ktraincps, knumpartials, kchroma, \
              ichannelmasks, krandommask, kwaveform1, kwaveform2, kwaveform3, \
              kwaveform4, iwaveamptab, a(ksamplepos1), a(ksamplepos2), a(ksamplepos3), \
              a(ksamplepos4), kwavekey1, kwavekey2, kwavekey3, kwavekey4, imax_grains

zawm a1, i_outza
zawm a2, i_outza+1
zawm a3, i_outza+2
zawm a4, i_outza+3
zawm a5, i_outza+4
zawm a6, i_outza+5
zawm a7, i_outza+6
zawm a8, i_outza+7

endin
