Class {
	#name : #SYNDivExceptionCatcherTag,
	#superclass : #WAGenericTag,
	#category : 'OOnoz-WebApplication-Core'
}

{ #category : #accessing }
SYNDivExceptionCatcherTag >> tag [
	^ #div
]

{ #category : #accessing }
SYNDivExceptionCatcherTag >> with: anObject [
	[ super with: anObject ]
		on: Error
		do: [ :anError | canvas render: 'Error : ' , anError asString ]
]
