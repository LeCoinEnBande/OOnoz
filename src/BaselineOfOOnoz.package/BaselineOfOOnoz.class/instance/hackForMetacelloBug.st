hack
hackForMetacelloBug
	"There is a bug in Metacello and it load the Cryptography from StHub :( For now I'll use a hack to reload the right one."
	
	Metacello new
		baseline:'Cryptography';
		repository: 'github://zweidenker/Cryptography:0.3.1/source';
		onConflict: [ :e | e useIncoming ];
		load: 'core'