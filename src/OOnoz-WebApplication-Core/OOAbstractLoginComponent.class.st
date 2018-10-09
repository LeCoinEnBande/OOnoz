Class {
	#name : #OOAbstractLoginComponent,
	#superclass : #OOComponent,
	#instVars : [
		'hasBeenValidated',
		'user'
	],
	#category : 'OOnoz-WebApplication-Core-Components'
}

{ #category : #accessing }
OOAbstractLoginComponent >> hasBeenValidated [
	^ hasBeenValidated
]

{ #category : #accessing }
OOAbstractLoginComponent >> hasBeenValidated: anObject [
	hasBeenValidated := anObject
]

{ #category : #initialization }
OOAbstractLoginComponent >> initialize [
	super initialize.
	self resetUser.
	self hasBeenValidated: false
]

{ #category : #accessing }
OOAbstractLoginComponent >> login [
	self subclassResponsibility 
]

{ #category : #rendering }
OOAbstractLoginComponent >> passwordForgottenCallback [
	self subclassResponsibility 
]

{ #category : #rendering }
OOAbstractLoginComponent >> renderButtonOn: html [
	self subclassResponsibility 
]

{ #category : #rendering }
OOAbstractLoginComponent >> renderComponentOn: html [
	self subclassResponsibility 
]

{ #category : #rendering }
OOAbstractLoginComponent >> renderContentOn: html [
	html div
		id: #connection;
		with: [ self renderComponentOn: html ]
]

{ #category : #rendering }
OOAbstractLoginComponent >> renderErrorOn: html [
	self hasBeenValidated
		ifFalse: [ ^ self ].
	html tbsAlert
		beDanger;
		with: [ html strong: 'Identification impossible. '.
			html
				text: 'L''utilisateur ou le mot de passe est incorrect. Vérifiez que vos identifiants soient corrects et que votre compte est activé.' ]
]

{ #category : #rendering }
OOAbstractLoginComponent >> renderForgottenPasswordLinkOn: html [
	html anchor
		callback: [ self passwordForgottenCallback ];
		with: 'Mot de passe oublié'
]

{ #category : #rendering }
OOAbstractLoginComponent >> renderFormContentOn: html [
	html
		tbsRow: [ html
				tbsColMs: 8
				mo: 2
				with: [ self renderErrorOn: html.
					self renderMailInputOn: html.
					self renderPasswordInputOn: html.
					self renderButtonOn: html ] ]
]

{ #category : #rendering }
OOAbstractLoginComponent >> renderFormOn: html [
	html
		section: [ html form
				class: #'text-center';
				with: [ self renderFormContentOn: html ] ].
	html footer
		beCentered;
		with: [ self renderForgottenPasswordLinkOn: html ]
]

{ #category : #rendering }
OOAbstractLoginComponent >> renderMailInputOn: html [
	html
		tbsFormGroup: [ | id label |
			label := 'Email'.
			html label
				for: (id := html nextId);
				tbsScreenReaderOnly;
				with: label.
			html emailInput
				tbsFormControl;
				id: id;
				required;
				autofocus;
				placeholder: label;
				callback: [ :mail | self user: (OOUser selectOne: [ :u | u isActivated and: [ u mail = mail address ] ]) ];
				value: self user mail ]
]

{ #category : #rendering }
OOAbstractLoginComponent >> renderPasswordInputOn: html [
	html
		tbsFormGroup: [ | id label |
			label := 'Mot de passe'.
			html label
				for: (id := html nextId);
				tbsScreenReaderOnly;
				with: label.
			html passwordInput
				tbsFormControl;
				id: id;
				required;
				placeholder: label;
				callback: [ :pass | 
					(self user isNotNil and: [ self user passwordMatch: pass ])
						ifFalse: [ self resetUser ] ] ]
]

{ #category : #initialization }
OOAbstractLoginComponent >> resetUser [
	self user: OONilUser new
]

{ #category : #accessing }
OOAbstractLoginComponent >> user [
	^ user
]

{ #category : #accessing }
OOAbstractLoginComponent >> user: anObject [
	user := anObject
]
