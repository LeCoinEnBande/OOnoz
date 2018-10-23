"
I am a class whose goal is to help to the development of the application. 

I am a design pattern Interface. 
"
Class {
	#name : #OODevHelper,
	#superclass : #OOObject,
	#category : #'OOnoz-Development'
}

{ #category : #db }
OODevHelper class >> cleanDB [
	<script>
	{OOTheme.
	OOUser.
	OOAbstractMCQ.
	OOMCQResult.
	OOMCQRate} do: #removeAll
]

{ #category : #helpers }
OODevHelper class >> defaultServerLaunching [
	<script>
	OOServer setConfigurationWith: OOConfiguration new.
	ZnZincServerAdaptor startOn: OOServer current configuration port.
	self useInImageDebugger
]

{ #category : #db }
OODevHelper class >> generateUserWithMCQsInDB [
	<script>
	| user |
	user := OOUser new
		firstName: 'Aurélien';
		lastName: 'Rousseau';
		mail: 'pingu@gmail.com';
		password: 'ATestPass012#';
		birthday: (Date year: 1990 month: 01 day: 01);
		beOtherGender;
		country: 'France';
		state: 'Hauts-de-France';
		city: 'Lille';
		zip: '59000';
		address: '01 rue Jean Jaures';
		yourself.
	user mcqs: (OOInstancesGenerator generateMCQsUpTo: 30).
	user mcqs do: #save.
	user save
]

{ #category : #db }
OODevHelper class >> initDBdatas [
	<script>
	(STON
		fromString:
			(OOServer current configuration resourcesDirectory / 'Datas'
				/ 'datas.ston') contents) do: [ :set | set do: #save ]
]

{ #category : #helpers }
OODevHelper class >> initPlayground [
	<script>
	GTPlayground
		openContents:
			'OODevHelper
	defaultServerLaunching;
	setupMemoryDB.
	
	
	
	OOConfigurerPresenter open'
]

{ #category : #db }
OODevHelper class >> launchInMemoryVoyageBackEnd [
	<script>
	| repository |
	repository := VOMemoryRepository new.
	repository enableSingleton.
	^ repository
]

{ #category : #db }
OODevHelper class >> launchRealVoyageBackEnd [
	<script>
	| repository |
	repository := VOMongoRepository host: 'ds159188.mlab.com' port: 59188 database: 'pepit' username: 'pepit2' password: 'OOnozProject1'.
	repository enableSingleton.
	^ repository
]

{ #category : #helpers }
OODevHelper class >> openPlayground [
	<script>
	GTPlayground
		openContents:
			'OODevHelper 
	installGitFileTree;
	installNewBranch: ''lot1''; 
	defaultServerLaunching;
	launchRealVoyageBackEnd'
]

{ #category : #helpers }
OODevHelper class >> removeProxy [
	<script>
	NetworkSystemSettings useHTTPProxy: false
]

{ #category : #db }
OODevHelper class >> selectAll [
	<script>
	({OOTheme.
	OOUser.
	OOAbstractMCQ.
	OOMCQResult.
	OOMCQRate} flatCollect: #selectAll) inspect
]

{ #category : #helpers }
OODevHelper class >> setLille1Proxy [
	<script>
	NetworkSystemSettings
		useHTTPProxy: true;
		httpProxyPort: 3128;
		httpProxyServer: 'cache-etu.univ-lille1.fr'
]

{ #category : #db }
OODevHelper class >> setupMemoryDB [
	<script>
	self launchInMemoryVoyageBackEnd.
	self cleanDB.
	self initDBdatas
]

{ #category : #helpers }
OODevHelper class >> testingMCQInstance [
	^ OOMCQ
		questions:
			({('Who is the quality responsable?'
				->
					{('Aurélien' -> true).
					('Cyril' -> false).
					('Maxime' -> false).
					('Sylvie' -> false).
					('Laurence' -> false).
					('Clément' -> false)}).
			('Who is the technical responsable?'
				->
					{('Aurélien' -> false).
					('Cyril' -> true).
					('Maxime' -> false).
					('Sylvie' -> false).
					('Laurence' -> false).
					('Clément' -> false)}).
			('Who is the functional responsable?'
				->
					{('Aurélien' -> false).
					('Cyril' -> false).
					('Maxime' -> true).
					('Sylvie' -> false).
					('Laurence' -> false).
					('Clément' -> false)}).
			('Who is the manager?'
				->
					{('Aurélien' -> false).
					('Cyril' -> false).
					('Maxime' -> false).
					('Sylvie' -> true).
					('Laurence' -> false).
					('Clément' -> false)}).
			('Who is the MOA?'
				->
					{('Aurélien' -> false).
					('Cyril' -> false).
					('Maxime' -> false).
					('Sylvie' -> false).
					('Laurence' -> true).
					('Clément' -> false)}).
			('Who is the quality teacher?'
				->
					{('Aurélien' -> false).
					('Cyril' -> false).
					('Maxime' -> false).
					('Sylvie' -> false).
					('Laurence' -> false).
					('Clément' -> true)}).
			('Who is the MOE?'
				->
					{('Aurélien' -> true).
					('Cyril' -> true).
					('Maxime' -> true).
					('Sylvie' -> true).
					('Laurence' -> false).
					('Clément' -> false)}).
			('What is the name of the project?'
				->
					{('OOnoz' -> true).
					('Toto' -> false).
					('Beulzland' -> false).
					('Timoleon' -> false).
					('Potatoz' -> false).
					('Partinizer' -> false)}).
			('Who is the best?'
				->
					{('Aurélien' -> false).
					('Cyril' -> false).
					('Maxime' -> false).
					('Sylvie' -> false).
					('Laurence' -> false).
					('Clément' -> false)}).
			('Random ?! Test your luck.'
				->
					{('Aurélien' -> false).
					('Cyril' -> false).
					('Maxime' -> false).
					('Sylvie' -> true).
					('Laurence' -> false).
					('Clément' -> false)})}
				collect: [ :each | 
					OOMultipleAnswersQuestion
						description: each key
						answers: (each value collect: [ :asso | OOAnswer text: asso key isRight: asso value ]) asSet ])
				asSet
]

{ #category : #helpers }
OODevHelper class >> useInImageDebugger [
	"Because it's a pain in the ass to always set it by hand in Seaside settings."

	<script>
	WAApplication allInstancesDo: [ :app | app exceptionHandler: WADebugErrorHandler ]
]
