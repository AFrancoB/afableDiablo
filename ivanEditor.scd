/////////////  midi collider -> logic


(
p = ProxySpace.push(s);
n = ProxyMixer(p, 32, options: [\playN]);
p.clock= TempoClock.default.tempo=(60/60);
p.quant_(1);
//StageLimiter.activate;
);


(
p.pop;
);


p.clock= TempoClock.default.tempo=(60/60);






////////////////////////////////////armonía///////////////////////////////

~sh1.play
~sh1.pause
~sh1.resume
~sh1.clear
~sh1.send


~sh2.play
~sh2.pause
~sh2.resume
~sh2.clear
~sh2.send

(
(
 //thisThread.randSeed = Date.seed.postln;

~sh1=Pbind(
	\midinote, Prand([58, 60, 62, 67], inf),   //   (95, 107)
	\dur, Prand([1, 1.5, 2, 5], inf),
	\type, \midi,
	\midiout, a,
	\amp, 0.3,
	\chan, 0,
));

(
 //thisThread.randSeed = Date.seed.postln;

~sh2=Pbind(
	\midinote, Prand([45, 55, 62]+36, inf),   //   (95, 107)
	\dur, Prand([1, 1.1]*0.1, inf),
	\type, \midi,
	\midiout, a,
	\amp, 0.4,
	\chan, 0,
));
)


~mf1.play
~mf1.pause
~mf1.resume
~mf1.clear
~mf1.send


~mf2.play
~mf2.pause
~mf2.resume
~mf2.clear
~mf2.send


(
(
 thisThread.randSeed = Date.seed.postln;

~mf1=Pbind(
	\midinote, Prand([45, 55, 62]-24, inf),   //   (95, 107)
	\dur, Prand([4, 5, 1], inf),
	\type, \midi,
	\midiout, b,
	\amp, Pwhite(0.1, 0.5, inf),
	\chan, 0,
));

(
 thisThread.randSeed = Date.seed.postln;

~mf2=Pbind(
	\midinote, Prand([45, 55, 62], inf),   //   (95, 107)
	\dur, Prand([5, 7], inf),
	\type, \midi,
	\midiout, b,
	\amp, Pwhite(0.1, 0.4, inf),
	\chan, 0
));
)



(
~sh1.pause;
~sh2.pause;
~mf1.pause;
~mf2.pause;
)


(
~sh1.resume;
~sh2.resume;
~mf1.resume;
~mf2.resume;
)

////////////////////////////////////batería///////////////////////////////

(
~kick.play;
~snare.play;
~hihat.play;
)


~kick.play
~kick.pause
~kick.resume
~kick.clear


~snare.play
~snare.pause
~snare.resume
~snare.clear



~hihat.play
~hihat.pause
~hihat.resume
~hihat.clear

(
~kick.pause;
~snare.pause;
~hihat.pause;
)


(
~kick.resume;
~snare.resume;
~hihat.resume;
)


(

(
 //thisThread.randSeed = Date.seed.postln;

~kick=Pbind(
	\midinote, 60,
	\dur, Pwrand([1, Pseq([0.25], 3), Pseq([0.5, 0.75], 2), 1.5, 1.1 ], [0.4, 0.1, 0.1, 0.35, 0.05], inf)*0.5,
	\type, \midi,
	\midiout, c,
	\amp, 0.8,
	\chan, 0,
));



(
 //thisThread.randSeed = Date.seed.postln;

~snare=Pbind(
	\midinote, 62,
	\dur, Pwrand([Pseq([1] /* *0.5 */, 1), Pseq([0.1, 0.75], 1), Pseq([0.25, 0.25], 1)], [0.7, 0.2, 0.1], inf),
	\type, \midi,
	\midiout, c,
	\amp, Pseq([0, 0.5], inf),
	\chan, 0,
));


(
 //thisThread.randSeed = Date.seed.postln;

~hihat=Pbind(
	\midinote, 64,
	\dur, Prand([1, 1.1, 1.3, 1.5, Pseq([0.3], Pshuf([7, 10, 20, 40], 1))] *0.5/** 0.2*/, inf),
	\type, \midi,
	\midiout, c,
	\amp, 0.3,
	\chan, 0,
));
)