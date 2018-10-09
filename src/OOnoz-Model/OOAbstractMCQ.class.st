Class {
	#name : #OOAbstractMCQ,
	#superclass : #OOObject,
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #accessing }
OOAbstractMCQ class >> allActives [
	^ self selectMany: [ :m | m isActivated ]
]

{ #category : #accessing }
OOAbstractMCQ class >> allActivesFromSubTheme: aSubTheme playableBy: aUser [
	^ self allActives select: [ :mcq | (mcq subThemes includes: aSubTheme) and: [ (OOMCQResult selectOne: [ :res | res mcq = mcq and: [ res user = aUser ] ]) isNil ] ]
]

{ #category : #accessing }
OOAbstractMCQ class >> allActivesFromTheme: aTheme playableBy: aUser [
	^ self allActives select: [ :mcq | mcq theme = aTheme and: [ (OOMCQResult selectOne: [ :res | res mcq = mcq and: [ res user = aUser ] ]) isNil ] ]
]

{ #category : #accessing }
OOAbstractMCQ class >> allActivesPlayableBy: aUser [
	^ self allActives reject: [ :mcq | (OOMCQResult selectOne: [ :res | res mcq = mcq and: [ res user = aUser ] ]) isNotNil ]
]

{ #category : #testing }
OOAbstractMCQ class >> isAbstract [
	^ self = OOAbstractMCQ 
]

{ #category : #voyage }
OOAbstractMCQ class >> isVoyageRoot [
	^ true
]

{ #category : #magicNumbers }
OOAbstractMCQ class >> maximumNumberOfQuestions [
	^ 20
]

{ #category : #magicNumbers }
OOAbstractMCQ class >> minimumNumberOfQuestions [
	^ self maximumNumberOfQuestions
]

{ #category : #'instance creation' }
OOAbstractMCQ class >> questions: aCollection [
	^ self new
		questions: aCollection;
		yourself
]

{ #category : #comparing }
OOAbstractMCQ >> = anObject [
	^ self species = anObject species
		and: [ self sortedQuestions = anObject sortedQuestions
				and: [ self title = anObject title
						and: [ self description = anObject description
								and: [ self orderer = anObject orderer
										and:
											[ self price = anObject price and: [ self imagePath = anObject imagePath and: [ self backgroundPath = anObject backgroundPath and: [ self level = anObject level and: [ self state = anObject state ] ] ] ] ] ] ] ] ]
]

{ #category : #adding }
OOAbstractMCQ >> addQuestion: aQuestion [
	self subclassResponsibility
]

{ #category : #adding }
OOAbstractMCQ >> addSubTheme: aSubTheme [
	self subThemes add: aSubTheme
]

{ #category : #accessing }
OOAbstractMCQ >> backgroundPath [
 ^ self subclassResponsibility 
]

{ #category : #accessing }
OOAbstractMCQ >> backgroundPath: anObject [
	self subclassResponsibility
]

{ #category : #momento }
OOAbstractMCQ >> createMemento [
	"I am used for the memento pattern. My goal is to save my current state in a memento of me."

	^ self copy
]

{ #category : #accessing }
OOAbstractMCQ >> defaultOrderer [
	self orderer: OODefaultOrder 
]

{ #category : #accessing }
OOAbstractMCQ >> description [
	^ self subclassResponsibility
]

{ #category : #accessing }
OOAbstractMCQ >> description: aString [
	self subclassResponsibility
]

{ #category : #accessing }
OOAbstractMCQ >> gift [
	^ OONilGift
]

{ #category : #testing }
OOAbstractMCQ >> hasGift [
	^ false
]

{ #category : #accessing }
OOAbstractMCQ >> imagePath [
 ^ self subclassResponsibility 
]

{ #category : #accessing }
OOAbstractMCQ >> imagePath: anObject [
	self subclassResponsibility
]

{ #category : #'error handing' }
OOAbstractMCQ >> invalidate: aString [
	(OOInvalidMCQ modelObject: self reason: aString) signal
]

{ #category : #accessing }
OOAbstractMCQ >> isActivated [
	^ self state = #active
]

{ #category : #testing }
OOAbstractMCQ >> isChallenge [
	^ false
]

{ #category : #testing }
OOAbstractMCQ >> isELearning [
	^ self isChallenge not
]

{ #category : #testing }
OOAbstractMCQ >> isFree [
	^ self price = 0
]

{ #category : #accessing }
OOAbstractMCQ >> isInactivated [
	^ self state ~= #active
]

{ #category : #accessing }
OOAbstractMCQ >> level [
 ^ self subclassResponsibility 
]

{ #category : #accessing }
OOAbstractMCQ >> level: anObject [
	self subclassResponsibility
]

{ #category : #accessing }
OOAbstractMCQ >> markingScheme [
	^ self subclassResponsibility
]

{ #category : #accessing }
OOAbstractMCQ >> markingScheme: aClass [
	self subclassResponsibility
]

{ #category : #accessing }
OOAbstractMCQ >> orderedQuestions [
	^ self subclassResponsibility
]

{ #category : #accessing }
OOAbstractMCQ >> orderer [
	^ self subclassResponsibility
]

{ #category : #accessing }
OOAbstractMCQ >> orderer: anOrderer [
	self subclassResponsibility
]

{ #category : #accessing }
OOAbstractMCQ >> price [
	^ self subclassResponsibility
]

{ #category : #accessing }
OOAbstractMCQ >> price: anInteger [
	self subclassResponsibility
]

{ #category : #printing }
OOAbstractMCQ >> printPrice [
	^ self price asString , 'C'
]

{ #category : #accessing }
OOAbstractMCQ >> questions [
	^ self subclassResponsibility
]

{ #category : #accessing }
OOAbstractMCQ >> questions: aCollection [
	self subclassResponsibility
]

{ #category : #accessing }
OOAbstractMCQ >> randomOrderer [
	self orderer: OORandomOrder
]

{ #category : #removing }
OOAbstractMCQ >> removeQuestion: aQuestion [ 
	self subclassResponsibility
]

{ #category : #removing }
OOAbstractMCQ >> removeSubTheme: aSubTheme [
	self subThemes remove: aSubTheme
]

{ #category : #initialization }
OOAbstractMCQ >> resetSubThemes [
	self subThemes: OrderedCollection new
]

{ #category : #momento }
OOAbstractMCQ >> restoreFromMemento: aMemento [
	"I am used for the memento pattern. My goal is to set my state to the set of the memento.
	I let the questions manage their own memento."

	self description: aMemento description.
	self markingScheme: aMemento markingScheme.
	self title: aMemento title.
	self orderer: aMemento orderer
]

{ #category : #accessing }
OOAbstractMCQ >> sortedQuestions [
	^ self questions ifNotNil: [ :qs | qs asArray sort: [ :a :b | a index < b index ] ]
]

{ #category : #accessing }
OOAbstractMCQ >> state [
	^ self subclassResponsibility 
]

{ #category : #accessing }
OOAbstractMCQ >> state: anObject [ 
	self subclassResponsibility 
]

{ #category : #accessing }
OOAbstractMCQ >> subThemes [
	^ self subclassResponsibility 
]

{ #category : #accessing }
OOAbstractMCQ >> subThemes: aColl [
	self subclassResponsibility 
]

{ #category : #accessing }
OOAbstractMCQ >> theme [
	^ self subThemes ifNotEmpty: [ self subThemes anyOne theme ] ifEmpty: [ nil ]
]

{ #category : #accessing }
OOAbstractMCQ >> title [
	^ self subclassResponsibility
]

{ #category : #accessing }
OOAbstractMCQ >> title: aString [
	self subclassResponsibility
]

{ #category : #validation }
OOAbstractMCQ >> validate [
	self subclassResponsibility
]

{ #category : #validation }
OOAbstractMCQ >> validateMCQ [
	self subclassResponsibility
]
