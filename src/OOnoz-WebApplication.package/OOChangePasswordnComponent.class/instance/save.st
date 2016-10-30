action
save
	self isOldPasswordValid
		ifFalse: [ ^ self errorMessage: 'L''ancien mot de passe est éronné.' ].
		
	self newPassword ifNil: [ self isOldPasswordValid: false. ^ self errorMessage: 'Le nouveau mot de passe est invalide.' ].
	
	self user directPassword: self newPassword.
	self user save