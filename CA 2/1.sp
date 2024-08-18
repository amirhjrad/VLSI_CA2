

.lib "32nm_bulk.pm"


.param K = 1
.param Wn = K
.param Wp = 2*K


M1 out A x0 GND nmos L=0.18u W=2*Wn
M2 x0 VDD GND GND nmos L=0.18u W=2*Wn
M3 out A VDD VDD pmos L=0.18u W=Wp
M4 out VDD VDD VDD pmos L=0.18u W=Wp
Vdd VDD 0 DC 5
VA A 0 pulse(0 1.8 0 0 0 10n 20n)


.end