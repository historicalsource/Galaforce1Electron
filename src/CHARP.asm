\\
\\ Galaforce 1 ( Electron ) from the original 6502 source code, adapted to assemble using beebasm
\\
\\ (c) Kevin Edwards 1986-2019
\\
\\ Twitter @KevEdwardsRetro
\\

\\ REM SAVE"CHARP"
\\ B%=P%
\\ [OPT pass
 
.prnstr
LDA strdat,Y:STA temp1
CLC:ADC #4:STA nxt_cht+1
LDA strdat+1,Y:STA temp1+1
ADC #0:STA nxt_cht+2
LDY #0
LDA (temp1),Y:TAX
AND #&F8:STA temp2
TXA:AND #3
STA temp3+1
INY:LDA (temp1),Y:STA temp2+1
INY:LDA (temp1),Y:STA temp3
INY:LDA (temp1),Y:AND #&88
STA temp4+1:STA temp5
LDX temp3+1:BEQ nxt_cht
.sh_rght
LSR temp5
DEX:BNE sh_rght
 
.nxt_cht
LDA &FFFF
STA temp4
ASL A:ASL A
CLC:ADC temp4
STA nxt_clm+1
LDX #0
.nxt_clm
LDA &700,X:\   CHARACTER SET
STA temp5+1
LDY #0
.com_col
LSR temp5+1
BCC skipr
LDA temp5
EOR (temp2),Y
STA (temp2),Y
.skipr
INY
CPY #8:BCC com_col
JSR mv_rgt_pix
INX
CPX #5:BNE nxt_clm
JSR mv_rgt_pix
INC nxt_cht+1
BNE nhigh
INC nxt_cht+2
.nhigh
DEC temp3
BNE nxt_cht
 
 
.mv_rgt_pix
LSR temp5
INC temp3+1
LDA temp3+1
CMP #4:BCC ntnxtchr
LDA #0:STA temp3+1
LDA temp4+1
STA temp5
LDA temp2
CLC:ADC #8
STA temp2
BCC ntnxtchr
INC temp2+1
.ntnxtchr
RTS
 
.strdat EQUW paustxt
        EQUW SCRtext
        EQUW HItext
        EQUW entering_wave
        EQUW gameover
        EQUW pressspace
        EQUW galaforce
        EQUW myname
        EQUW letter_S_Q
        EQUW letter_K_J
        EQUW pressspace2
        EQUW finish1
        EQUW finish2
        EQUW finish3
        EQUW finish4
        EQUW copyr
        EQUW p123
        EQUW tocyc
        EQUW clou1
        EQUW clou2
        EQUW clou3
        EQUW spxt
        EQUW entnam
        EQUW za
        EQUW zb
        EQUW plus1
 
.paustxt
 EQUW &7FF2:EQUB1:EQUB 8
 EQUB 17
 
.SCRtext
 EQUW &5808:EQUB 3:EQUB &88
 EQUB28:EQUB12:EQUB27:\ 'SCR'
 
.HItext
 EQUW &58A8:EQUB 2:EQUB &88
 EQUB17:EQUB18:\ 'HI'
 
.entering_wave
 EQUW &6740:EQUB 16:EQUB &88
 EQUB14:EQUB23:EQUB29:EQUB14:\ ENTE
 EQUB27:EQUB18:EQUB23:EQUB16:\ RING
 EQUB38:EQUB35:EQUB24:EQUB23:\  ZON
 EQUB14:EQUB38
.wave_text
 EQUB38:EQUB38
.gameover
 EQUW &64E8:EQUB 9:EQUB &88
 EQUB16:EQUB10:EQUB22:EQUB14:\ GAME
 EQUB38:EQUB24:EQUB31:EQUB14:\  OVE
 EQUB27:\ R
 
.pressspace
 EQUW &73B0:EQUB 19:EQUB 8
 EQUB25:EQUB27:EQUB14:EQUB28:\ PRES
 EQUB28:EQUB38:EQUB28:EQUB25:\ S SP
 EQUB10:EQUB12:EQUB14:EQUB38:\ ACE
 EQUB29:EQUB24:EQUB38:EQUB25:\ TO P
 EQUB21:EQUB10:EQUB34:\ LAY
 
.pressspace2
 EQUW &7538:EQUB 7:EQUB 8
 EQUB29:EQUB24:EQUB38:EQUB25:\ TO P
 EQUB21:EQUB10:EQUB34:\ LAY
 
.galaforce
 EQUW &5C00:EQUB 9:EQUB &88
 EQUB16:EQUB10:EQUB21:EQUB10:\ GALA
 EQUB15:EQUB24:EQUB27:EQUB12:EQUB14:\ FORCE
 
.myname
 EQUW &6100:EQUB 16:EQUB &80
 EQUB11:EQUB34:EQUB38:EQUB20:\ BY K
 EQUB14:EQUB31:EQUB18:EQUB23:\ EVIN
 EQUB38:EQUB14:EQUB13:EQUB32:\  EDW
 EQUB10:EQUB27:EQUB13:EQUB28:\ ARDS
 
.letter_S_Q
 EQUW &7FE8:EQUB 1:EQUB &88
.sound_letter
 EQUB 28
 
.letter_K_J
 EQUW &7FDA:EQUB 1:EQUB &80
.key_joy_letter
 EQUB 20
 
.finish1
 EQUW&69FA:EQUB 6:EQUB &88
 EQUB28:EQUB10:EQUB29:EQUB30:\ SATU
 EQUB27:EQUB23:\ RN
 
.finish2
 EQUW&69F3:EQUB 7:EQUB &88
 EQUB11:EQUB10:EQUB29:EQUB29:\ BATT
 EQUB14:EQUB27:EQUB34:\ ERY
 
.finish3
 EQUW&6A00:EQUB 5:EQUB &88
 EQUB29:EQUB30:EQUB27:EQUB11:\ TURB
 EQUB24:\ O
 
.finish4
\ Not used !!
 
.copyr
 EQUW&79FA:EQUB 17:EQUB &88
 EQUB28:EQUB30:EQUB25:EQUB14:\SUPE
 EQUB27:EQUB18:EQUB24:EQUB27:\RIOR
 EQUB38:EQUB28:EQUB24:EQUB15:\ SOF
 EQUB29:EQUB32:EQUB10:EQUB27:\TWAR
 EQUB14:\ E
 
.p123
 EQUW&5E8A:EQUB 14:EQUB 8
 EQUB25:EQUB27:EQUB14:EQUB28:EQUB28:\ PRESS
 EQUB38:EQUB1:EQUB38:EQUB2:EQUB38:EQUB24:EQUB27:EQUB38:EQUB3:\ 1 2 OR 3
 
.tocyc
 EQUW&6240:EQUB 16:EQUB 8
 EQUB29:EQUB24:EQUB38:EQUB12:EQUB34:EQUB12:EQUB21:EQUB14:\ CYCLE
 EQUB38:EQUB12:EQUB24:EQUB21:EQUB24:EQUB30:EQUB27:EQUB28:\ COLOURS
 
.clou1
 EQUW&69F0:EQUB 8:EQUB 8
 EQUB12:EQUB24:EQUB21:EQUB24:EQUB30:EQUB27:EQUB38:EQUB1
 
.clou2
 EQUW&6C70:EQUB 8:EQUB &80
 EQUB12:EQUB24:EQUB21:EQUB24:EQUB30:EQUB27:EQUB38:EQUB2
 
.clou3
 EQUW&6EF0:EQUB 8:EQUB &88
 EQUB12:EQUB24:EQUB21:EQUB24:EQUB30:EQUB27:EQUB38:EQUB3
 
.spxt
 EQUW&750B:EQUB 14:EQUB 8
 EQUB27:EQUB14:EQUB29:EQUB30:EQUB27:EQUB23:EQUB38:\ RETURN
 EQUB29:EQUB24:EQUB38:\ TO
 EQUB14:EQUB33:EQUB18:EQUB29:\ EXIT
 
.entnam
 EQUW&5D48:EQUB 15:EQUB 8
 EQUB14:EQUB23:EQUB29:EQUB14:EQUB27:EQUB38:\ ENTER
 EQUB34:EQUB24:EQUB30:EQUB27:EQUB38:\ YOUR
 EQUB23:EQUB10:EQUB22:EQUB14:\ NAME
 
.za
 EQUW&FFFF:EQUB1:EQUB &88
.zs
 EQUB&FF
 
.zb
 EQUW&FFFF:EQUB21:EQUB&88
.zt
 EQUB0:\ 1 to 8
 EQUB38:\ space
 EQUS"1234567":\ score
 EQUB38:EQUB38:\ spaces
 EQUS"1234567890":\ name
 
.plus1
 EQUW&7FD0:EQUB1:EQUB 8
.plus2
 EQUB13

\\ ]
\\ PRINT"Char print from &";~B%;" to &";~P%-1;" (";P%-B%;")"
\\ PAGE=PG%:RETURN
