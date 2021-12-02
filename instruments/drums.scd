(
var path = thisProcess.nowExecutingPath.dirname;
var drumBank = path++"/drumKits" ++ "/IAMM_Kits/Kit_1"; /// aca van los samples de bataca
drumBank.postln;
var gestoBank = path++"gestos";


~bataca = SoundFile.collectIntoBuffers(drumBank++"/*");
~gestos = SoundFile.collectIntoBuffers(gestoBank++"/*")

~diccGestos = Dictionary.new;
///// ******* crear diccionario //////
)


///// diccionario de gestos.


//// convencion pa nombrar samples de gestos para el breakbeateador:
// nombreIndice.wav  //////

/// convencion de gestos: 44100, 24, stereo;


(   //// synth para hacer breakbeatazos
SynthDef(\breakbeateador,  { |nombreDeGesto=0, out=0, pan=0, amp=0.3, rate=1, trig=0, pos=0, gate=1, att=0.1, sus=0.5, rel=0.1|
	var buffer, ifloop, posi, sig, env;

	buffer = ~drums[0];///// extraer del diccionario el sample y su bufnum y todo ese desmadre;

	ifloop = if(trig==0, {0}, {1});

	posi = (pos*(buffer.numFrames)).round.asInteger;

	sig = PlayBuf.ar(2,buffer.bufnum,rate,Impulse.kr(trig),posi, ifloop);
	sig = Pan2.ar(sig, pan);

	env = EnvGen.kr(Env([0,1,1,0],[att,sus,rel]),gate, doneAction:2);

	Out.ar(out, sig*env*amp)


}).add
)



//// convencion pa nombrar samples:
// nombreIndice.extension
//bombo0.wav
//protesta0.wav


( ////// synths de percusiones!!

~bataca.collect{ |item, iter|


	        ///// cambiar el nombre de samples por algo mas chidoliro
	SynthDef(item.bufnum.asSymbol, { |out=0, pan=0, amp=0.3, rate=1, trig=0, gate=1|
		var trigg, dur, sig, env;

		trigg = if(trig==0, {0}, {1});

		dur = (item.numFrames / 44100);

		sig = PlayBuf.ar(item.numChannels,item.bufnum, rate, Impulse.kr(trig), 0,trigg);
		sig = Pan2.ar(sig, pan);
		env = EnvGen.kr(Env([0,1,1,0],[0,dur*0.95,0.05]),gate, doneAction:2);

		Out.ar(out, sig*env*amp)


	}).add;


	item.bufnum.postln

}
)





(    ////////// sinchos de granulacion estocastica



)