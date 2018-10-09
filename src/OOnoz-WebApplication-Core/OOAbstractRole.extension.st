Extension { #name : #OOAbstractRole }

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractRole class >> displayName [
	^ self subclassResponsibility
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractRole class >> logToAdminApplication [
	^ self subclassResponsibility
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractRole class >> setRole [
	^ false
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractRole class >> validateMCQs [
	^ false
]
