(
var path = thisProcess.nowExecutingPath.dirname;
var synths = path ++ "/instruments/Synths.sc";
//var midiConfig = path ++ "/midiConfig.scd";
s.options.numBuffers = 1024 * 16;
Server.default.options.memSize= 512000*20;
Server.default.options.maxNodes=128*1024;
Server.default.options.numWireBufs= 512;

// interface
//Server.default.options.device = "ASIO : MOTU Pro Audio";   ////// Interfaz de Alejandro
//Server.default.options.device = "Fireface UCX (23893620)"; ////// Interfaz de Ivan

// outputs
//Server.default.options.numOutputBusChannels = 64;

Server.default.options.sampleRate = 48000;

s.boot;

s.waitForBoot({
	synths.load; // carga los synths
//	midiConfig.load;
});

)


