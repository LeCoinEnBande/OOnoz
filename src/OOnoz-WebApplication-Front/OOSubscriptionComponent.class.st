Class {
	#name : #OOSubscriptionComponent,
	#superclass : #OOAbstractUserEditionComponent,
	#category : 'OOnoz-WebApplication-Front-Components'
}

{ #category : #actions }
OOSubscriptionComponent >> cancel [
	self displayDefaultScreen
]

{ #category : #actions }
OOSubscriptionComponent >> checkIfUserCanBeCreated [
	self user validate.
	self user checkDisponibility
]

{ #category : #actions }
OOSubscriptionComponent >> emailTemplate [
	^ '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inscription à OOnoz</title>
</head>
<body style="background-color: #00695C;margin:0;padding:0;">
<div style="background-color: #FFF;display:block;margin: auto;width:80%;color:black;margin-top:100px;border-radius: 5px; padding: 30px;font-family:''Lato'', ''Helvetica Neue'',Helvetica,Arial,sans-serif;">
    <p>Merci {{{USERNAME}}} pour votre inscription! Pour activer votre compte veuillez cliquer sur le lien suivant ou le copier coller dans
        l''URL de votre navigateur: </p>
    <a href="{{{URL}}}"
       style="text-decoration: none;color:#00695C;">{{{URL}}}</a>

</div>
</body>
</html>'
]

{ #category : #initialization }
OOSubscriptionComponent >> initialize [
	super initialize.
	self user: OOUser new
]

{ #category : #rendering }
OOSubscriptionComponent >> renderCGUModalOn: html [
	html
		tbsModalHeader: [ html tbsModalCloseIcon ariaLabel: 'Close'.
			html tbsModalTitle level3 with: 'Conditions générales d''utilisation' ].
	html tbsModalBody: [ html text: 'Les données personnelles que vous nous communiquez seront utilisées uniquement pour vous permettre de bénéficier de nos services. Conformément à la loi Informatique et libertés du 6 janvier 1978 modifiée, vous disposez de droits d''accès, de rectification et d''opposition aux données personnelles vous concernant. Vous pouvez exercer ces droits en écrivant à l’adresse OOnoz, rue du papier, 59650 Villeneuve d''Ascq , ou sur cette page. Un justificatif d’identité pourra être demandé par voie postale à l’adresse précitée.' ].
	html
		tbsModalFooter: [ html tbsButton
				dataDismiss: 'modal';
				bePush;
				with: 'Fermer' ]
]

{ #category : #rendering }
OOSubscriptionComponent >> renderCGUOn: html [
	self currentUser isAdmin ifTrue: [ ^ self ].
	
	html tbsFormGroup
		class: 'checkbox';
		style: 'text-align: left;';
		with: [ html checkbox
				id: html nextId;
				value: false.
			html label
				id: 'cguLabel';
				for: html lastId;
				with: [ html text: 'J''accepte les '.
					html anchor
						onClickUpdateRootDialogWith: [ :r | self renderCGUModalOn: r ];
						with: 'conditions d''utilisation'.
					html text: ' de OOnoz.' ] ].
	html document addLoadScript: 'initSubscriptionForm();' js
]

{ #category : #rendering }
OOSubscriptionComponent >> renderContentOn: html [
	html
		tbsContainer: [ html
				tbsRow: [ html
						tbsColMs: 8
						mo: 2
						with: [ html form
								id: 'form';
								class: #'text-center';
								with: [ self renderFormContentOn: html.
									self renderButtonsOn: html ] ] ] ]
]

{ #category : #rendering }
OOSubscriptionComponent >> renderEmailInputOn: html [
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
				callback: [ :mail | self user directMail: mail address ];
				value: self user mail ]
]

{ #category : #rendering }
OOSubscriptionComponent >> renderFormContentOn: html [
	html heading
		level4;
		with: 'Informations'.
	html
		tbsRow: [ html
				tbsColMs: 10
				mo: 1
				with: [ self renderUserErrorOn: html.
					self renderInputsNameOn: html.
					self renderEmailInputOn: html.
					self renderPostalAdresseOn: html.
					self renderPasswordInputsOn: html.
					self renderBirthdayOn: html.
					self renderGenderInputOn: html.
					self renderRoleInputOn: html.
					self renderCGUOn: html ] ]
]

{ #category : #rendering }
OOSubscriptionComponent >> renderPasswordInputsOn: html [
	html
		tbsFormGroup: [ | id label helpId |
			label := 'Mot de passe'.
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
				callback: [ :pass | self user password: pass ].
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
					(self user passwordMatch: pass)
						ifFalse: [ self user password: nil ] ] ]
]

{ #category : #rendering }
OOSubscriptionComponent >> renderUserErrorOn: html [
	self hasBeenValidated ifFalse: [ ^ self ].
	
	[ self checkIfUserCanBeCreated ]
		on: OOInvalidUser, OOUnavailableUser
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'L''utilisateur n''est pas valide ! '.
					html text: e reason ] ].
			
		html tbsAlert
				beDanger;
				with: [ html strong: 'L''utilisateur n''a pas été créé! '.
					html text: 'Désolé mais quelque chose s''est mal passé. Vérifiez que votre mail est valide ou réessayez plus tard.' ]
]

{ #category : #actions }
OOSubscriptionComponent >> save [
	[ self checkIfUserCanBeCreated.
	self sendSubscriptionEmail.
	self user save.
	self user: OOUser new.
	(self rootComponent instanceOf: OOWelcomePage) message: 'Inscription validée. Un email de confirmation vous a été envoyé.'.
	self displayDefaultScreen ]
		on: OOError
		do: [ :err | self hasBeenValidated: true ]
]

{ #category : #actions }
OOSubscriptionComponent >> sendSubscriptionEmail [
	self flag: #todo.
	self emailUtils
		sendEmailTo: self user mail
		subject: 'Inscription à OOnoz'
		htmlBody:
			((self emailTemplate
				copyReplaceAll: '{{{URL}}}'
				with:
					(String
						streamContents: [ :s | 
							s
								<< 'http://';
								<< self configuration domainName;
								<< $:;
								<< self configuration port;
								<< '/OOnozValidation?key=';
								<< self user mail;
								<< '&value=';
								<< self user mail hash ])) copyReplaceAll: '{{{USERNAME}}}' with: self user displayName)
]
