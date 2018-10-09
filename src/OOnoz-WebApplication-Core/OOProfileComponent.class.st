Class {
	#name : #OOProfileComponent,
	#superclass : #OOAbstractUserEditionComponent,
	#instVars : [
		'memento',
		'avatarError',
		'changePasswordComponent'
	],
	#category : 'OOnoz-WebApplication-Core-Components'
}

{ #category : #accessing }
OOProfileComponent >> avatarError [
	^ avatarError
]

{ #category : #accessing }
OOProfileComponent >> avatarError: aString [ 
	avatarError := aString
]

{ #category : #actions }
OOProfileComponent >> cancel [
	self currentUser restoreFromMemento: self memento.
	super cancel
]

{ #category : #accessing }
OOProfileComponent >> changePasswordComponent [
	^ changePasswordComponent
]

{ #category : #accessing }
OOProfileComponent >> changePasswordComponent: anObject [
	changePasswordComponent := anObject
]

{ #category : #hooks }
OOProfileComponent >> children [
	^ Array with: self changePasswordComponent
]

{ #category : #initialization }
OOProfileComponent >> initialize [
	super initialize.
	self changePasswordComponent: OOChangePasswordnComponent new.
	self user: self currentUser
]

{ #category : #accessing }
OOProfileComponent >> memento [
	^ memento
]

{ #category : #accessing }
OOProfileComponent >> memento: anObject [
	memento := anObject
]

{ #category : #rendering }
OOProfileComponent >> renderAvatarErrorOn: html [
	self avatarError ifNil: [ ^ self ].
	
	html tbsAlert
		beDanger;
		with: [ html strong: 'Avatar incorrect. '.
			html text: 'Un avatar doit faire moins de 1Mo et être une image au format png.' ].
		
	self avatarError: nil
]

{ #category : #rendering }
OOProfileComponent >> renderAvatarInuputOn: html [
	self flag: #clean.
	html image
		style: 'height: 100px; width: 100px; border-radius:5000px';
		url: (self user avatarUrlFrom: self configuration).
	self renderAvatarErrorOn: html.
	html
		tbsFormGroup: [ html fileUpload
				class: 'toHide';
				style: 'display: inline-block;';
				onChange: 'submit()';
				callback: [ :file | self updateAvatar: file ].
			html paragraph
				class: #'help-block';
				with: 'Image au format png de moins de 1Mo.' ]
]

{ #category : #rendering }
OOProfileComponent >> renderAvatarManagementOn: html [
	html form
		multipart;
		class: #'text-center';
		with: [ self renderAvatarInuputOn: html.
			self user hasAvatar
				ifTrue: [ html tbsAnchor
						beDanger;
						callback: [ self user hasAvatar: false.
							self user save ];
						with: 'Supprimer Avatar' ].
			(self user hasAvatar not and: [ (self configuration resourcesDirectory / 'Avatars' / (self user mail , '.png')) exists ])
				ifTrue: [ html tbsAnchor
						beInfo;
						callback: [ self user hasAvatar: true.
							self user save ];
						with: 'Restaurer le dernier avatar' ] ]
]

{ #category : #rendering }
OOProfileComponent >> renderButtonsOn: html [
	html div
		class: #clearfix;
		with: [ html div
				tbsPullRight;
				style: 'margin: 20px;';
				with: [ self renderSaveButtonOn: html.
					html space.
					self renderResetButtonOn: html ] ]
]

{ #category : #rendering }
OOProfileComponent >> renderContentOn: html [
	html
		tbsContainer: [ html
				tbsRow: [ html
						tbsColMs: 8
						mo: 2
						with: [ self renderAvatarManagementOn: html.
							html hr.
							html
								form: [ self renderFormContentOn: html.
									self renderButtonsOn: html ].
							html hr.
							html render: self changePasswordComponent ] ] ]
]

{ #category : #rendering }
OOProfileComponent >> renderEmailInputOn: html [
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
				placeholder: label;
				readOnly;
				value: self user mail ]
]

{ #category : #rendering }
OOProfileComponent >> renderFormContentOn: html [
	html heading
		class: 'text-center';
		level4;
		with: 'Informations'.
	self renderUserErrorOn: html.
	self renderInputsNameOn: html.
	self renderEmailInputOn: html.
	self renderPostalAdresseOn: html.
	self renderBirthdayOn: html.
	self renderGenderInputOn: html.
	self renderRoleInputOn: html
]

{ #category : #rendering }
OOProfileComponent >> renderUserErrorOn: html [
	self hasBeenValidated ifFalse: [ ^ self ].
	
	[ self user validate ]
		on: OOInvalidUser
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'L''utilisateur n''est pas valide ! '.
					html text: e reason ] ].
			
	html tbsAlert
		beDanger;
		with: [ html strong: 'L''utilisateur n''a pas été édité ! '.
			html text: 'Désolé mais quelque chose s''est mal passé. Vérifiez que votre mail est valide ou réessayez plus tard.' ]
]

{ #category : #actions }
OOProfileComponent >> save [
	[ self user validate.
	self user save.
	self answer: true ]
		on: OOInvalidObject
		do: [ :err | self hasBeenValidated: true ]
]

{ #category : #actions }
OOProfileComponent >> updateAvatar: aFile [
	aFile size <= (1024 * 1024)
		ifFalse: [ self avatarError: 'Fichier trop gros. Maximum: 1Mo.'.
			^ self ].
	aFile contentType greaseString = 'image/png'
		ifFalse: [ self avatarError: 'Le fichier doit être une image.'.
			^ self ].
	(self configuration resourcesDirectory / 'Avatars' / (self user mail , '.' , aFile contentType sub))
		ensureCreateFile;
		writeStreamDo: [ :s | 
			s
				binary;
				<< aFile contents ].
	self user hasAvatar: true.
	self user save
]

{ #category : #accessing }
OOProfileComponent >> user: anUser [
	super user: anUser.
	self memento: anUser createMemento
]
