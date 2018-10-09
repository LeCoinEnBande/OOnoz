Class {
	#name : #OOInstancesGenerator,
	#superclass : #OOObject,
	#classVars : [
		'Lorem'
	],
	#category : 'OOnoz-Development'
}

{ #category : #helpers }
OOInstancesGenerator class >> generateAnswersUpTo: anInteger rights: anotherInteger [
	| remainingRights res |
	remainingRights := anotherInteger.
	res := Set new.
	1 to: anInteger do: [ :int | 
		| answer |
		answer := OOAnswer new.
		answer index: int.
		answer text: self lorem atRandom.
		remainingRights = 0
			ifFalse: [ remainingRights := remainingRights - 1.
				answer isRight: true ]..
		res add: answer ].
	^ res
]

{ #category : #helpers }
OOInstancesGenerator class >> generateMCQsUpTo: anInteger [
	| res |
	res := OrderedCollection new.
	1 to: anInteger do: [ :int | 
		| mcq |
		mcq := OOMCQ new.
		mcq title: self lorem atRandom.
		mcq questions: (self generateQuestionsUpTo: (OOMCQ minimumNumberOfQuestions to: OOMCQ maximumNumberOfQuestions) atRandom).
		mcq markingScheme: (OOAbstractMarkingSchemeStrategy allSubclasses reject: #isAbstract) atRandom.
		mcq orderer: (OOAbstractOrder allSubclasses reject: #isAbstract) atRandom.
		res add: mcq ].
	^ res
]

{ #category : #helpers }
OOInstancesGenerator class >> generateNewBirthdayDate [
	^ Date
		year: (1960 to: 2000) atRandom
		month: (01 to: 12) atRandom
		day: (01 to: 28) atRandom
]

{ #category : #helpers }
OOInstancesGenerator class >> generateQuestionsUpTo: anInteger [
	| res |
	res := Set new.
	1 to: anInteger do: [ :int | 
		| question |
		question := (OOAbstractQuestion allSubclasses reject: #isAbstract) atRandom new.
		question description: self lorem atRandom.
		question index: int.
		(1 to: 2) atRandom even
			ifTrue: [ question correction: self lorem atRandom ].
		self setAnswersOf: question.
		res add: question ].
	^ res
]

{ #category : #helpers }
OOInstancesGenerator class >> generateSubTheme [
	^ (OOSubTheme
		title: (String loremIpsum: (5 to: 30) atRandom)
		description: (String loremIpsum: (20 to: 700) atRandom))
		mediaLink: self randomImage;
		yourself
]

{ #category : #helpers }
OOInstancesGenerator class >> generateTheme [
	| theme |
	theme := OOTheme
		title: (String loremIpsum: (5 to: 30) atRandom)
		description: (String loremIpsum: (20 to: 700) atRandom).
	theme mediaLink: self randomImage.
	(1 to: 30) atRandom timesRepeat: [ theme addSubTheme: self generateSubTheme ].
	^ theme
]

{ #category : #helpers }
OOInstancesGenerator class >> generateUserFirstName: first lastName: last role: role [
	| city |
	city := self randomCity.
	^ OOUser new
		firstName: first;
		lastName: last;
		mail: (first , '.' , last , '@gmail.com') asLowercase;
		password: 'JeSuis' , first , '1';
		birthday: OOInstancesGenerator generateNewBirthdayDate;
		gender: OOUser possibleGenders atRandom;
		country: 'France';
		state: OOInstancesGenerator randomStates;
		zip: (city := OOInstancesGenerator randomCity) value;
		city: city key;
		role: (role ifNil: [ OOPlayerRole ]);
		credits: (5 to: 100) atRandom;
		address: '13 rue du Templier';
		isActivated: #(true false true true) atRandom;
		hasAvatar: false;
		yourself
]

{ #category : #'class initialization' }
OOInstancesGenerator class >> initialize [
	| lorem |
	lorem := 'Lorem ipsum dolor sit amet, donec exercitation in pellentesque non, bibendum nec justo facilisi pellentesque elit. Mauris ut, molestie ac mauris lacus placerat, nulla quis magna, luctus sed. Turpis elementum. Sed nulla purus ante, purus in ac hymenaeos quis sed, inceptos duis, et posuere ut sem, magna torquent erat justo. Velit iaculis, enim rutrum. Rutrum vitae, donec lectus vestibulum, libero adipiscing eros mus lorem libero massa. Vivamus leo, suscipit nisl purus aenean, consectetuer est dictum fermentum est laoreet. Nibh nec dapibus ac dui. Elit fusce, erat penatibus, elit justo et sodales. Non turpis tortor consectetuer donec nibh donec, massa sed pulvinar rutrum, blandit eros interdum metus lorem sed. Et suscipit vitae placerat pulvinar mauris quis, vestibulum non hendrerit lectus dignissim leo, id suspendisse eget ipsum, netus posuere. Nam tempus dictum pellentesque, amet vitae fusce elit arcu massa natoque.

Purus nunc, nonummy lobortis imperdiet class. Fusce nec, quam dictum egestas commodo velit bibendum, commodo ut nec nostra, mi ipsum malesuada pretium orci vulputate nunc. Vestibulum duis orci ultrices, vitae ante, parturient per adipiscing egestas id ac. Vehicula nec dolor, et sit nec proin dui libero, est praesent rutrum torquent bibendum habitasse. Interdum quis, facilisis ultricies ad, sapien nunc dui nibh, auctor et semper laoreet, mi cras tellus ornare vivamus. Nam ipsum netus consequat suspendisse, cras leo dictum sollicitudin taciti nunc eget, viverra proin repudiandae, ipsum eget sed. Adipiscing vitae ullamcorper augue, pellentesque mi, rutrum feugiat, aenean nisl non bibendum in, risus non per donec id semper.

Erat metus ullamcorper, arcu lectus, sed nec lectus wisi vestibulum feugiat dui. Ullamcorper vitae vel aliquam sociosqu taciti, condimentum interdum sodales ante, urna mi sem, integer ante cursus elementum dui, a elit lectus ut ornare ante massa. Elementum suspendisse, aliquam vestibulum magna mauris eu ipsum, leo sit mi urna vel felis. Pretium mi adipiscing, porta mauris pede blandit sem, dolor auctor, augue lectus condimentum in. Luctus scelerisque. Felis pretium ligula, et morbi sequi, luctus neque etiam, eget consectetuer nec vestibulum quis. Luctus et, turpis vitae eu vulputate eget ac placerat, aliquam suspendisse vel in etiam molestie, dui sed amet nisl, mi arcu. Egestas donec elit ante hac imperdiet, nascetur dignissim ultrices dui mauris, varius in etiam tortor sollicitudin ut maecenas, augue integer cras. Erat wisi ac adipisci sed quis faucibus, orci sollicitudin ante tincidunt mus, eget feugiat ante, id pellentesque eget mauris a, dictumst maecenas sem. Laoreet congue amet sed nullam feugiat massa. Sed ut lacus ante libero, sed volutpat dolor sed, massa mauris rutrum auctor, interdum nonummy ullamcorper. Pellentesque a quam est et, rutrum hymenaeos nec aliquet.

Lobortis inceptos suspendisse, non pretium mattis amet nibh et, ex a elementum eu, parturient arcu diam quisque. Nonummy sed magna fermentum vehicula, proin mus. Libero id neque elit lacinia euismod at, sem in accumsan ex eu non, suscipit sit dictum. Eu in, mi sem lacus lectus blandit nulla diam, a arcu rhoncus, enim imperdiet nulla. Metus cras mi ut, a nunc wisi amet in egestas, justo egestas eu ut. Iaculis turpis mauris, neque ligula lacus beatae, cras malesuada pulvinar. In penatibus in sit libero suscipit, sollicitudin neque ac id volutpat, mauris officiis, metus ullamcorper fusce accumsan at integer sit, arcu sit ullamcorper nec felis. Mattis luctus integer nunc proin, magna magna rutrum non quisque mauris, erat massa neque est.'.
	Lorem := (($. split: lorem) flatCollect: [ :p | $, split: p ]) reject: #isEmpty
]

{ #category : #accessing }
OOInstancesGenerator class >> lorem [
	^ Lorem
]

{ #category : #helpers }
OOInstancesGenerator class >> randomCity [
	^ {('Paris' -> 75000).
	('Lille' -> 59000).
	('Marseille' -> 13000).
	('Lyon' -> 69000).
	('Metz' -> 57000).
	('Calais' -> 62000).
	('Épinal' -> 88000).
	('Toulouse' -> 34000).
	('Bordeau' -> 33000).
	('Nantes' -> 44000).
	('Besançon' -> 25000).
	('Toulon' -> 83000)} atRandom
]

{ #category : #helpers }
OOInstancesGenerator class >> randomImage [
	^ 'https://unsplash.it/' , (200 to: 400) atRandom asString , '/'
		, (200 to: 400) atRandom asString , '/?random'
]

{ #category : #accessing }
OOInstancesGenerator class >> randomPassword [
	| rand generator charsets |
	"Not ideal random for passwords..."
	rand := Random seed: Time millisecondClockValue hash.
	charsets := {'abcdefghijklmnopqrstuvwxyz' . '123456789' . 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' . '+#-_,:!'}.
	generator := [ :len | 
	| password ix lastSet |
	password := String new: len.
	ix := 1.
	[ ix <= len ]
		whileTrue: [ | set |
			set := charsets atRandom: rand.
			set == lastSet
				ifFalse: [ password at: ix put: (set atRandom: rand).
					lastSet := set.
					ix := ix + 1 ] ].
	password ].
	generator value: 42
]

{ #category : #helpers }
OOInstancesGenerator class >> randomStates [
	^ #('Auvergne-Rhône-Alpes' 'Bourgogne-Franche-Comté' 'Bretagne' 'Centre-Val de Loire' 'Corse' 'Grand Est' 'Guadeloupe' 'Guyane' 'Hauts-de-France' 'Île-de-France' 'La Réunion' 'Martinique' 'Mayotte' 'Normandie' 'Nouvelle-Aquitaine' 'Occitanie' 'Pays de la Loire' 'Provence-Alpes-Côte d''Azur')
		atRandom
]

{ #category : #helpers }
OOInstancesGenerator class >> randomStringBetween: min and: max [
	^ (min to: max) collect: [ :each | '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz#$<>&/-_\{}[]()=°*+@         ' atRandom ] as: String
]

{ #category : #helpers }
OOInstancesGenerator class >> setAnswersOf: question [
	| numberOfAnswers |
	numberOfAnswers := (question questionClass minimumNumberOfAnswers to: question questionClass maximumNumberOfAnswers) atRandom.
	question
		answers: (self generateAnswersUpTo: numberOfAnswers rights: (question questionClass minNumberOfRightAnswers to: (question questionClass maxNumberOfRightAnswers min: numberOfAnswers - 1)) atRandom)
]
