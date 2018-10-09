Class {
	#name : #OOFrontLoginComponent,
	#superclass : #OOAbstractLoginComponent,
	#category : 'OOnoz-WebApplication-Front-Components'
}

{ #category : #accessing }
OOFrontLoginComponent >> login [
	self user isLoggable
		ifTrue: [ self logUser: self user.
			self answer: true ]
		ifFalse: [ self hasBeenValidated: true ]
]

{ #category : #rendering }
OOFrontLoginComponent >> passwordForgottenCallback [
	self rootComponent setInstanceOf: OOPasswordForgottenComponent
]

{ #category : #rendering }
OOFrontLoginComponent >> renderButtonOn: html [
	html tbsButton
		bePrimary;
		bePush;
		style: 'margin-bottom: 20px; width: 100%;';
		onClick:
			(html jQuery ajax
				serializeForm;
				callback: [ self login ];
				onComplete: ((html jQuery id: 'connection') load html: [ :r | self renderComponentOn: r ]));
		with: 'Connexion'
]

{ #category : #rendering }
OOFrontLoginComponent >> renderComponentOn: html [
	self isLogged
		ifFalse: [ self renderFormOn: html ]
		ifTrue: [ self renderWelcomeMessageOn: html ]
]

{ #category : #rendering }
OOFrontLoginComponent >> renderWelcomeMessageOn: html [
	html tbsRow
		beCentered;
		with: [ html
				tbsColMs: 8
				mo: 2
				with: [ html image
						style: 'height: 100px; width: 100px; border-radius:5000px';
						url: (self currentUser avatarUrlFrom: self configuration).
					html heading
						level3;
						with: 'Bienvenue'.
					html div
						style: 'margin-top: 20px; margin-bottom: 20px;';
						with: 'Ça nous fait plaisir de vous revoir ' , self currentUser firstName.
					html break.
					html tbsAnchor
						callback: [ self rootComponent setInstanceOf: OOPlayPage ];
						bePrimary;
						with: 'Continuer' ] ]
]
