
(
Pdef(\uno,
	Pbind(\instrument, \waveShapeV3Perc,
		\dur, Pseq(Bjorklund2(5,32),inf)*Pseq([0.125,0.25,0.5,0.125*0.5],inf), \varTime, 0.001, \fase, Pseq([0.25pi,0.75pi,1.25pi,1.75pi],inf),
		\wMin,1010, \wMax, 1050, \midinote, Pseq(50 + [0,5,8,12,15,14,10,2,7,-5].pyramid,inf) , \amp, 0.15,
		\att, 0.01, \rel, Pwrand([0.4,0.1,0.5,0.5],[5,2,1,0.5].normalizeSum,inf), \out, Prand([10,20,0,20,10],inf))
);
Pdef(\unoo,
	Pbind(\instrument, \waveShapeV3Perc,
		\dur, Pseq(Bjorklund2(5,32),inf)*Pseq([0.125,0.25,0.5,0.125*0.5],inf), \varTime, 0.01, \fase, Pseq([0.25pi,0.75pi,1.25pi,1.75pi],inf),
		\wMin, Pseq([1010,2010,100,500],inf), \wMax, Pseq([1140,1040,2040],inf), \midinote, Pseq([38,26] + [0,5,8,12,10,14,17,8,5,0].stutter(2).reverse.pyramid,inf) + Pwrand([0,24,36,48],[5,2,1,0.5].normalizeSum,inf),
		\att, 0.01, \rel, Pwrand([0.8,0.01,2,4],[5,3,2,1].normalizeSum,inf), \out, Prand([10,0,20],inf))
);
Pdef(\dos,
	Pbind(\instrument, \waveShapeV3,
		\dur, Pseq(Bjorklund2(32,32),inf)*2, \varTime, 0.05, \fase, Pseq([0.25pi,0.75pi,1.25pi,1.75pi],inf),
		\wMin, Pseq([1010,2010,100,500],inf), \wMax, Pseq([1010,2010,100,500],inf) + Pseq([25,-25,50,-50],inf), \midinote, Pseq(0 + [2,3,5].reverse.pyramid,inf) + Pwrand([0,0],[1,10,2,3].normalizeSum,inf),
		\att, 5, \rel, 10, \amp, 0.075, \out, [10,20])
);
Pdef(\tres,
	Pbind(\instrument, \waveShapeV3,
		\dur, 10, \varTime, 0.1, \fase, Pseq([0.25pi,0.75pi,1.25pi,1.75pi],inf),
		\wMin, 1000, \wMax, Pseq([2000,2100,1600,2666],inf), \midinote, Pseq([50,62] + [-5,-6,0,3,7,8,5,12,14].pyramid,inf)+Pseq([12,36,24,48,-24],inf),
		\att, 1.5, \rel, 15, \amp, 0.072, \out, [10,20])
);
{Mix(SinOsc.ar(50.midicps*[0.25,0.5],0,Line.kr(0.6,0,1.5,doneAction:2))).distort*1.5}.play
)

Pdef(\uno).stop
Pdef(\unoo).stop

Pdef(\dos).stop
Pdef(\tres).stop

(
Ndef(\fx, {

	Out.ar(0,Splay.ar(RLPF.ar(In.ar(10,2)*0.5,2200 + (LFNoise2.ar([0.5,0.25,1,2])*2000),0.1)));

	Out.ar(0,RLPF.ar(In.ar(20,2)*2,3000 + (SinOsc.ar(0.01)*2700),0.3)*0.3);


	///// necesitamos profundidad

});
)


Ndef(\fx).play; // play to main output.
Ndef(\fx).fadeTime = 8;


s.quit