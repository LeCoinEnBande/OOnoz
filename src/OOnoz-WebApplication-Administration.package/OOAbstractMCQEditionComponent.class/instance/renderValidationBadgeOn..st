rendering
renderValidationBadgeOn: html
	html tbsBadge
		beSuccessIf: self isValid;
		beDangerIf: self isValid not;
		with:
			(self isValid
				ifTrue: [ 'Valide' ]
				ifFalse: [ 'Invalide' ])