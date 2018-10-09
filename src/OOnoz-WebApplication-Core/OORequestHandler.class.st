Class {
	#name : #OORequestHandler,
	#superclass : #WARequestHandler,
	#category : 'OOnoz-WebApplication-Core'
}

{ #category : #initialization }
OORequestHandler class >> initialize [
	<oonozApplication>
	WAAdmin register: self at: 'OOnozValidation'
]

{ #category : #handling }
OORequestHandler >> activate: user from: aRequestContext [
	^ aRequestContext request
		at: 'value'
		ifPresent: [ :value | 
			value = user mail hash asString
				ifTrue: [ user
						activate;
						save.
					'Succés: Votre compte a bien été activé.' ]
				ifFalse: [ 'Erreur: La requête est fausse. Vérifié que votre lien correspond au lien envoyé.' ] ]
		ifAbsent: [ 'Erreur: Requête incorrecte.' ]
]

{ #category : #handling }
OORequestHandler >> handleFiltered: aRequestContext [
	aRequestContext
		respond: [ :response | 
			response
				contentType: WAMimeType textPlain;
				nextPutAll: (self tryToActivateUserFrom: aRequestContext) ]
]

{ #category : #handling }
OORequestHandler >> tryToActivateUserFrom: aRequestContext [
	^ aRequestContext request
		at: 'key'
		ifPresent: [ :mail | 
			(OOUser selectOne: [ :u | u mail = mail ])
				ifNil: [ 'Erreur: Aucun compte à activer pour cette adresse email. Il est possible que la requête ai expirée.' ]
				ifNotNil: [ :user | self activate: user from: aRequestContext ] ]
		ifAbsent: [ 'Erreur: Requête incorrecte.' ]
]
