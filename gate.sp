.lib '32nm_bulk.pm' 32nm

************Invertor**********
.SUBCKT INV1 IN OUT
M1 	OUT 	IN 		VDD		VDD	PMOS 	L=Lmin	W='120*Wn1'
M2 	OUT		IN 		0 			0  		NMOS 	L=Lmin	W='60*Wn1'
Vsup2	VDD	0	Vc
.ENDS INV1

************NAND_2**********
.SUBCKT NAND2 INA   INB  OUT
M1 	OUT 	INA 		VDD		VDD	PMOS 	L=Lmin	W='16*Wn1'
M2 	OUT 	INB 		VDD		VDD	PMOS 	L=Lmin	W='16*Wn1'
M3 	OUT		INA 		j 			0  		NMOS 	L=Lmin	W='16*Wn1'
M4 	j		INB 		0 			0  		NMOS 	L=Lmin	W='16*Wn1'
Vsup2	VDD	0	Vc
.ENDS NAND2

************NAND_3**********
.SUBCKT NAND3 INA   INB  INC    OUT
M1 	OUT 	INA 		VDD		VDD	PMOS 	L=Lmin	W='2*k*Wn1'
M2 	OUT 	INB 		VDD		VDD	PMOS 	L=Lmin	W='2*k*Wn1'
M3 	OUT 	INC 		VDD		VDD	PMOS 	L=Lmin	W='2*k*Wn1'
M4 	OUT		INA 		j 			0  		NMOS 	L=Lmin	W='3*k*Wn1'
M5 	j		INB 		i 			0  		NMOS 	L=Lmin	W='3*k*Wn1'
M6 	i		INC 		0 			0  		NMOS 	L=Lmin	W='3*k*Wn1'
Vsup2	VDD	0	Vc
.ENDS NAND3
 q
************NOR_2**********
.SUBCKT NOR2 INA   INB  OUT
M1 	OUT 	INA 		j		VDD	PMOS 	L=Lmin	W='48*Wn1'
M2 	j 	INB 		VDD		VDD	PMOS 	L=Lmin	W='48*Wn1'
M3 	OUT		INA 		0 			0  		NMOS 	L=Lmin	W='12*Wn1'
M4 	OUT		INB 		0 			0  		NMOS 	L=Lmin	W='12*Wn1'
Vsup2	VDD	0	Vc
.ENDS NOR2
************MODULE************
X7		out1 	L INV
X1		A 	VDD   m   NAND2
X2		m 	VDD   VDD   i   NAND3
X3		m 	VDD   VDD   j   NAND3
X4		m 	VDD   VDD   n   NAND3
X5		n 	0   k   NOR2
X6		n 	0   out1   NOR2



Vsup1	VDD	0	Vc

************Inputes**************
VA	A	0	PWL	0n 0, 200n 0, '200n+t' Vc, 400n Vc, '400n+t' 0, 600n 0, '600n+t' Vc, 800n Vc, '800n+t' 0,
+1000n 0, '1000n+t' Vc, 1200n Vc, '1200n+t' 0, 1400n 0, '1400n+t' Vc, 1600n Vc


**********parameter**************
.param Vc=1.8
.param Lmin=32n
.param Wn1=32n
.param k=8
.param t = 0.01n
**********simulation************
.op
.tran	1p	2000n
.measure    tran    tf    trig    V(out1)    td=199n val='Vc*0.9' cross=1 targ    
+V(out1)    td=199n val='Vc*0.1' cross=1
.measure    tran    tr    trig    V(out1)    td=399n val='Vc*0.1' cross=1 targ    
+V(out1)    td=399n val='Vc*0.9' cross=1
.measure	tran	avgpower	AVG	power	from=0n to=2000n
**********Alters************
.alter case 2:
.param k = '8*1.03'

.alter case 3:
.param k = '8*1.06'

.alter case 4:
.param k = '8*1.09'

.alter case 5:
.param k = '8*1.12'

.alter case 6:
.param k = '8*1.15'

.alter case 7:
.param k = '8*1.18'

.alter case 8:
.param k = '8*1.21'

.alter case 9:
.param k = '8*1.24'

.alter case 10:
.param k = '8*1.27'

.alter case 11:
.param k = '8*1.3'

.alter case 12:
.param k = '8*0.97'

.alter case 13:
.param k = '8*0.94'

.alter case 14:
.param k = '8*0.91'

.alter case 15:
.param k = '8*0.88'

.alter case 16:
.param k = '8*0.85'

.alter case 17:
.param k = '8*0.82'

.alter case 18:
.param k = '8*0.79'

.alter case 19:
.param k = '8*0.76'

.alter case 20:
.param k = '8*0.73'

.alter case 21:
.param k = '8*0.7'


.OPTIONS post=2

.END
