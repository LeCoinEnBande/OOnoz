Class {
	#name : #OOChangePasswordnComponent,
	#superclass : #OOComponent,
	#traits : 'OOTClassicForm - {#cancel. #renderCancelButtonOn:. #renderCancelModalFor:on:}',
	#classTraits : 'OOTClassicForm classTrait',
	#instVars : [
		'errorMessage',
		'isOldPasswordValid',
		'newPassword'
	],
	#category : 'OOnoz-WebApplication-Core-Components'
}

{ #category : #accessing }
OOChangePasswordnComponent >> errorMessage [
	^ errorMessage
]

{ #category : #accessing }
OOChangePasswordnComponent >> errorMessage: anObject [
	errorMessage := anObject
]

{ #category : #initialization }
OOChangePasswordnComponent >> initialize [
	super initialize.
	self isOldPasswordValid: false
]

{ #category : #accessing }
OOChangePasswordnComponent >> isOldPasswordValid [
	^ isOldPasswordValid
]

{ #category : #accessing }
OOChangePasswordnComponent >> isOldPasswordValid: anObject [
	isOldPasswordValid := anObject
]

{ #category : #accessing }
OOChangePasswordnComponent >> newPassword [
	^ newPassword
]

{ #category : #accessing }
OOChangePasswordnComponent >> newPassword: anObject [
	newPassword := anObject
]

{ #category : #rendering }
OOChangePasswordnComponent >> renderButtonsOn: html [
	html div
		tbsPullRight;
		style: 'margin: 20px;';
		with: [ self renderSaveButtonOn: html.
			html space.
			self renderResetButtonOn: html ]
]

{ #category : #rendering }
OOChangePasswordnComponent >> renderContentOn: html [
	html
		form: [ self renderFormContentOn: html.
			self renderButtonsOn: html ]
]

{ #category : #rendering }
OOChangePasswordnComponent >> renderErrorMessageOn: html [
	self errorMessage ifNil: [ ^ self ].
	
	html tbsAlert
		beDanger;
		with: [ html strong: 'Impossible de changer de mot de passe ! '.
			html text: self errorMessage ].
			
	self errorMessage: nil
]

{ #category : #rendering }
OOChangePasswordnComponent >> renderFormContentOn: html [
	html heading
		class: 'text-center';
		level4;
		with: 'Changer de mot de passe'.
	self renderErrorMessageOn: html.
	self renderOldPasswordInputOn: html.
	self renderNewPasswordInputsOn: html
]

{ #category : #rendering }
OOChangePasswordnComponent >> renderNewPasswordInputsOn: html [
	html
		tbsFormGroup: [ | id label helpId |
			label := 'Nouveau mot de passe'.
			html label
				for: (id := html nextId);
				tbsScreenReaderOnly;
				with: label.
			html passwordInput
				tbsFormControl;
				id: id;
				ariaDescribedby: (helpId := html nextId);
				required;
				pattern: '(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$';
				placeholder: label;
				callback: [ :pass | 
					self isOldPasswordValid
						ifTrue: [ self newPassword: (self user cipher: pass) ] ].
			html tbsHelpBlockId: helpId with: 'Un mot de passe doit comporter au moins 8 caractères avec des minuscules, des majuscules et des nombres/caractères spéciaux.' ].
	html
		tbsFormGroup: [ | id label |
			label := 'Confirmation du mot de passe'.
			html label
				for: (id := html nextId);
				tbsScreenReaderOnly;
				with: label.
			html passwordInput
				tbsFormControl;
				id: id;
				required;
				pattern: '(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$';
				placeholder: label;
				callback: [ :pass | 
					(self isOldPasswordValid and: [ self newPassword isNotEmpty ])
						ifTrue: [ (self user cipher: pass) = newPassword
								ifFalse: [ self newPassword: nil ] ] ] ]
]

{ #category : #rendering }
OOChangePasswordnComponent >> renderOldPasswordInputOn: html [
	html
		tbsFormGroup: [ | id label |
			label := 'Ancien mot de passe'.
			html label
				for: (id := html nextId);
				tbsScreenReaderOnly;
				with: label.
			html passwordInput
				tbsFormControl;
				id: id;
				required;
				pattern: '(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$';
				placeholder: label;
				callback: [ :pass | self isOldPasswordValid: (self user passwordMatch: pass) ] ]
]

{ #category : #actions }
OOChangePasswordnComponent >> save [
	self isOldPasswordValid
		ifFalse: [ ^ self errorMessage: 'L''ancien mot de passe est éronné.' ].
		
	self newPassword ifNil: [ self isOldPasswordValid: false. ^ self errorMessage: 'Le nouveau mot de passe est invalide.' ].
	
	self user directPassword: self newPassword.
	self user save
]

{ #category : #accessing }
OOChangePasswordnComponent >> user [
	^ self currentUser
]
