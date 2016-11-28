rendering
renderNewPasswordInputsOn: html
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