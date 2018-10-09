Class {
	#name : #OOWelcomePage,
	#superclass : #OOComponent,
	#instVars : [
		'subscriptionComp',
		'loginComp',
		'message'
	],
	#category : 'OOnoz-WebApplication-Front-Pages'
}

{ #category : #asserting }
OOWelcomePage class >> shouldShowJumbotron [
	^ true
]

{ #category : #accessing }
OOWelcomePage >> loginComp [
	^ loginComp ifNil: [ loginComp := OOFrontLoginComponent new ]
]

{ #category : #accessing }
OOWelcomePage >> message [
	^ message
]

{ #category : #accessing }
OOWelcomePage >> message: anObject [
	message := anObject
]

{ #category : #rendering }
OOWelcomePage >> renderContentOn: html [
	html
		tbsJumbotron: [ html tbsContainer
				class: 'jumbotron-content';
				with: [ self message
						ifNotNil: [ :m | 
							html tbsAlert
								beSuccess;
								with: m.
							self message: nil ].
					html heading: 'Le slogand d''OOnoz ici'.
					html paragraph: 'OOnoz est une plateforme de QCM en ligne.'.
					self renderPlayButtonOn: html ] ]
]

{ #category : #rendering }
OOWelcomePage >> renderLoginModalOn: html [
	html
		tbsModalHeader: [ html tbsModalCloseIcon ariaLabel: #Close.
			html tbsModalTitle
				level: 4;
				with: 'Connexion' ].
	html tbsModalBody: [ html render: self loginComp ]
]

{ #category : #rendering }
OOWelcomePage >> renderPlayButtonOn: html [
	(self isLogged
		ifTrue: [ html tbsAnchor
				callback: [ self rootComponent setInstanceOf: OOPlayPage ];
				yourself ]
		ifFalse: [ html tbsButton
				onClickUpdateRootDialogWith: [ :canvas | self renderLoginModalOn: canvas ];
				yourself ])
		bePrimary;
		beLarge;
		with: 'Jouez maintenant !'
]
