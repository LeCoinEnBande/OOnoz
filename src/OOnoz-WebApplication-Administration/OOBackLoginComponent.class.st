Class {
	#name : #OOBackLoginComponent,
	#superclass : #OOAbstractLoginComponent,
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #accessing }
OOBackLoginComponent >> login [
	(self user isLoggable and: [ self user can logToAdminApplication ])
		ifTrue: [ self logUser: self user.
			self answer: true ]
		ifFalse: [ self hasBeenValidated: true ]
]

{ #category : #rendering }
OOBackLoginComponent >> passwordForgottenCallback [
	self call: OOPasswordForgottenComponent answering
]

{ #category : #rendering }
OOBackLoginComponent >> renderButtonOn: html [
	html tbsSubmitButton
		bePrimary;
		callback: [ self login ];
		style: 'margin-bottom: 20px; width: 100%;';
		with: 'Connexion'
]

{ #category : #rendering }
OOBackLoginComponent >> renderComponentOn: html [
	html
		article: [ html
				header: [ html heading
						beCentered;
						level: 3;
						with: 'Connexion' ].
			self renderFormOn: html ]
]
