Class {
	#name : #OOFirstGiftStrategy,
	#superclass : #OOAbstractGiftStrategy,
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #action }
OOFirstGiftStrategy >> winners [
	^ ((OOMCQResult selectMany: [ :r | r mcq gift = self gift and: [ r isAllRight ] ] sortBy: [ :r1 :r2 | r1 dateEnd < r2 dateEnd ])
		collect: #user) takeFirst: self gift number
]
