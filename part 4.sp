
.SUBCKT INV IN OUT
M1 	OUT 	IN 		VDD		VDD	PMOS 	L=Lmin	W='120*Wn1'
M2 	OUT		IN 		0 			0  		NMOS 	L=Lmin	W='60*Wn1'
Vsup2	VDD	0	Vc
.ENDS INV
*********************
.SUBCKT NAND2 INA   INB  OUT
M1 	OUT 	INA 		VDD		VDD	PMOS 	L=Lmin	W='16*Wn1'
M2 	OUT 	INB 		VDD		VDD	PMOS 	L=Lmin	W='16*Wn1'
M3 	OUT		INA 		j 			0  		NMOS 	L=Lmin	W='16*Wn1'
M4 	j		INB 		0 			0  		NMOS 	L=Lmin	W='16*Wn1'
Vsup2	VDD	0	Vc
.ENDS NAND2
**********************
.SUBCKT NAND3 INA   INB  INC    OUT
M1 	OUT 	INA 		VDD		VDD	PMOS 	L=Lmin	W='16*Wn1'
M2 	OUT 	INB 		VDD		VDD	PMOS 	L=Lmin	W='16*Wn1'
M3 	OUT 	INC 		VDD		VDD	PMOS 	L=Lmin	W='16*Wn1'
M4 	OUT		INA 		j 			0  		NMOS 	L=Lmin	W='24*Wn1'
M5 	j		INB 		i 			0  		NMOS 	L=Lmin	W='24*Wn1'
M6 	i		INC 		0 			0  		NMOS 	L=Lmin	W='24*Wn1'
Vsup2	VDD	0	Vc
.ENDS NAND3
**********************
.SUBCKT NOR2 INA   INB  OUT
M1 	OUT 	INA 		j		VDD	PMOS 	L=Lmin	W='48*Wn1'
M2 	j 	INB 		VDD		VDD	PMOS 	L=Lmin	W='48*Wn1'
M3 	OUT		INA 		0 			0  		NMOS 	L=Lmin	W='12*Wn1'
M4 	OUT		INB 		0 			0  		NMOS 	L=Lmin	W='12*Wn1'
Vsup2	VDD	0	Vc
.ENDS NOR2
************************
X1	A 	VDD   m   NAND2
X2	m 	VDD   VDD   i   NAND3
X3	m 	VDD   VDD   j   NAND3
X4	m 	VDD   VDD   n   NAND3
X5	n 	0   k   NOR2
X6	n 	0   out1   NOR2
X7	out1 	L INV
*********************
Vsup1	VDD	0	Vc
**********************
VA	A	0	PWL	0n 0, 200n 0, '200n+t' Vc, 400n Vc, '400n+t' 0, 600n 0, '600n+t' Vc, 800n Vc, '800n+t' 0,
+1000n 0, '1000n+t' Vc, 1200n Vc, '1200n+t' 0, 1400n 0, '1400n+t' Vc, 1600n Vc
******************
.lib '32nm_bulk.pm' 32nm
.param Vc=1.8
.param Lmin=32n
.param Wn1=32n
.param t = 0.01n
***************
.op
.tran	1p	2000n
.measure    tran    tf    trig    V(out1)    td=199n val='Vc*0.9' cross=1 targ    
+V(out1)    td=199n val='Vc*0.1' cross=1
.measure    tran    tr    trig    V(out1)    td=399n val='Vc*0.1' cross=1 targ    
+V(out1)    td=399n val='Vc*0.9' cross=1
*.measure	tran	avgpower	AVG	power	from=0n to=2000
**************************
.alter case 2:
.param k = '8*1.1'
.alter case 3:
.param k = '8*1.15'
.alter case 4:
.param k = '8*1.2'
.alter case 5:
.param k = '8*1.25'
.alter case 6:
.param k = '8*1.3'
.alter case 7:
.param k = '8*1.35'
.alter case 8:
.param k = '8*1.33'
.alter case 9:
.param k = '8*1.29'
.alter case 10:
.param k = '8*1.27'
.alter case 11:
.param k = '8*1.23'
.alter case 12:
.param k = '8*1.1'
.alter case 13:
.param k = '8*0.98'
.alter case 14:
.param k = '8*0.96'
.alter case 15:
.param k = '8*0.93'
.alter case 16:
.param k = '8*0.89'
.alter case 17:
.param k = '8*0.84'
.alter case 18:
.param k = '8*0.81'
.alter case 19:
.param k = '8*0.79'
.alter case 20:
.param k = '8*0.75'
.alter case 21:
.param k = '8*0.72'

.OPTIONS post=2
.end
