Class {
	#name : #OOGift,
	#superclass : #OOAbstractGift,
	#instVars : [
		'description',
		'number',
		'winningStrategy'
	],
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #'instance creation' }
OOGift class >> description: aString [
	^ self new
		description: aString;
		yourself
]

{ #category : #'as yet unclassified' }
OOGift class >> mongoWinningStrategy [
	<mongoDescription>
	^ VOToOneDescription new
		attributeName: 'winningStrategy';
		accessor:
			(MAPluggableAccessor
				read: [ :gift | 
					gift winningStrategy copy
						gift: nil;
						yourself ]
				write: [ :gift :strat | 
					gift
						winningStrategy:
							(strat
								gift: gift;
								yourself) ]);
		yourself
]

{ #category : #comparing }
OOGift >> = anObject [
	^ super = anObject and: [ self number = anObject number ]
]

{ #category : #accessing }
OOGift >> beFirstToWin [
	self winningStrategy: (OOFirstGiftStrategy gift: self)
]

{ #category : #accessing }
OOGift >> beRandomWin [
	self winningStrategy: (OORandomGiftStrategy gift: self)
]

{ #category : #accessing }
OOGift >> description [
	^ description
]

{ #category : #accessing }
OOGift >> description: anObject [
	description := anObject
]

{ #category : #testing }
OOGift >> hasGift [
	^ true
]

{ #category : #initialization }
OOGift >> initialize [
	super initialize.
	self beFirstToWin
]

{ #category : #accessing }
OOGift >> number [
	^ number
]

{ #category : #accessing }
OOGift >> number: anObject [
	number := anObject
]

{ #category : #copying }
OOGift >> postCopy [
	super postCopy.
	self winningStrategy: self winningStrategy copy
]

{ #category : #accessing }
OOGift >> remainingGifts [
	^ self number - self winners size max: 0
]

{ #category : #accessing }
OOGift >> winners [
	^ self winningStrategy winners
]

{ #category : #accessing }
OOGift >> winningStrategy [
	^ winningStrategy
]

{ #category : #accessing }
OOGift >> winningStrategy: anObject [
	winningStrategy := anObject
]
