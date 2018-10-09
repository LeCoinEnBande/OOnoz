Class {
	#name : #OOPasswordForgottenComponent,
	#superclass : #OOComponent,
	#instVars : [
		'hasBeenValidated',
		'user',
		'shouldAnswer'
	],
	#category : 'OOnoz-WebApplication-Core-Components'
}

{ #category : #'instance creation' }
OOPasswordForgottenComponent class >> answering [
	^ self new
		shouldAnswer: true;
		yourself
]

{ #category : #action }
OOPasswordForgottenComponent >> emailTemplate [
	^ '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nouveau mot de passe</title>
</head>
<body style="background-color: #00695C;margin:0;padding:0;">
<div style="background-color: #FFF;display:block;margin: auto;width:80%;color:black;margin-top:100px;border-radius: 5px; padding: 30px;font-family:''Lato'', ''Helvetica Neue'',Helvetica,Arial,sans-serif;">
    <p>Bonjour {{{USERNAME}}},</p>
    <br>
    <p>Voici votre nouveau mot de passe: {{{PASSWORD}}}.</p>
</div>
</body>
</html>'
]

{ #category : #accessing }
OOPasswordForgottenComponent >> hasBeenValidated [
	^ hasBeenValidated
]

{ #category : #accessing }
OOPasswordForgottenComponent >> hasBeenValidated: anObject [
	hasBeenValidated := anObject
]

{ #category : #initialization }
OOPasswordForgottenComponent >> initialize [
	super initialize.
	self resetUser.
	self hasBeenValidated: false
]

{ #category : #generation }
OOPasswordForgottenComponent >> randomPassword [
	| rand password charsets ix lastSet |
	rand := Random seed: Time millisecondClockValue hash.
	charsets := {'abcdefghijklmnopqrstuvwxyz' . '123456789' . 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' . '+#-_,:!'}.
	password := String new: 10.
	ix := 1.
	[ ix <= 10 ]
		whileTrue: [ | set |
			set := charsets atRandom: rand.
			set == lastSet
				ifFalse: [ password at: ix put: (set atRandom: rand).
					lastSet := set.
					ix := ix + 1 ] ].
	charsets
		do: [ :coll | 
			(password anySatisfy: [ :let | coll includes: let ])
				ifFalse: [ password := password , (coll atRandom: rand) asString ] ].
	^ password
]

{ #category : #rendering }
OOPasswordForgottenComponent >> renderButtonOn: html [
	html tbsButton
		beSuccess;
		beSubmit;
		callback: [ self sendNewPassword ];
		with: 'Réinitialiser le mot de passe'.
	html space.
	html tbsAnchor
		beDanger;
		callback: [ self returnToLogin ];
		with: 'Annuler'
]

{ #category : #rendering }
OOPasswordForgottenComponent >> renderContentOn: html [
	html
		article: [ self renderTitleAndDescriptionOn: html.
			html
				section: [ html form
						class: #'text-center';
						with: [ self renderFormContentOn: html.
							self renderButtonOn: html ] ] ]
]

{ #category : #rendering }
OOPasswordForgottenComponent >> renderErrorOn: html [
	self hasBeenValidated ifFalse: [ ^ self ].
	
	html tbsAlert
		beDanger;
		with: [ html strong: 'Email incorrect.' ]
]

{ #category : #rendering }
OOPasswordForgottenComponent >> renderFormContentOn: html [
	html
		tbsRow: [ html
				tbsColMs: 8
				mo: 2
				with: [ self renderErrorOn: html.
					self renderMailInputOn: html ] ]
]

{ #category : #rendering }
OOPasswordForgottenComponent >> renderMailInputOn: html [
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
				placeholder: label;
				callback: [ :mail | self user: ((OOUser selectOne: [ :u | u mail = mail address ]) ifNil: [ OONilUser new ]) ];
				value: self user mail ]
]

{ #category : #rendering }
OOPasswordForgottenComponent >> renderTitleAndDescriptionOn: html [
	html header
		beCentered;
		with: [ html heading
				level3;
				with: self title ]
]

{ #category : #initialization }
OOPasswordForgottenComponent >> resetUser [
	self user: OONilUser new
]

{ #category : #rendering }
OOPasswordForgottenComponent >> returnToLogin [
	^ self shouldAnswer
		ifTrue: [ self answer ]
		ifFalse: [ self displayDefaultScreen ]
]

{ #category : #action }
OOPasswordForgottenComponent >> sendNewPassword [
	self user isLoggable
		ifTrue: [ | newPass |
			newPass := self randomPassword.
			self user password: newPass.
			self user save.
			self emailUtils
				sendEmailTo: self user mail
				subject: 'Nouveau mot de passe'
				htmlBody: ((self emailTemplate copyReplaceAll: '{{{PASSWORD}}}' with: newPass) copyReplaceAll: '{{{USERNAME}}}' with: self user displayName).
			self returnToLogin ]
		ifFalse: [ self hasBeenValidated: true ]
]

{ #category : #accessing }
OOPasswordForgottenComponent >> shouldAnswer [
	^ shouldAnswer ifNil: [ false ]
]

{ #category : #accessing }
OOPasswordForgottenComponent >> shouldAnswer: anObject [
	shouldAnswer := anObject
]

{ #category : #accessing }
OOPasswordForgottenComponent >> title [
	^ 'Réinitialiser le mot de passe'
]

{ #category : #accessing }
OOPasswordForgottenComponent >> user [
	^ user
]

{ #category : #accessing }
OOPasswordForgottenComponent >> user: anObject [
	user := anObject
]
