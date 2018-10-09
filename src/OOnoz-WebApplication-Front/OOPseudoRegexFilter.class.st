Class {
	#name : #OOPseudoRegexFilter,
	#superclass : #OOObject,
	#category : 'OOnoz-WebApplication-Front-Filter'
}

{ #category : #testing }
OOPseudoRegexFilter class >> adaptPattern: aPattern [
	^ String
		streamContents: [ :s | 
			(aPattern includes: $*)
				ifFalse: [ s << '.*' ].
			s << ('.*' join: ($* split: aPattern)).
			(aPattern includes: $*)
				ifFalse: [ s << '.*' ] ]
]

{ #category : #testing }
OOPseudoRegexFilter class >> isMatching: aString with: aPattern [
	^ (self adaptPattern: aPattern) asRegexIgnoringCase matches: aString
]
