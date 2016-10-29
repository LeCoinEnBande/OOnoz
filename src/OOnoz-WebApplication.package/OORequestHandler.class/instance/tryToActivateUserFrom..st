handling
tryToActivateUserFrom: aRequestContext
	^ aRequestContext request
		at: 'key'
		ifPresent: [ :mail | 
			(OOUser selectOne: [ :u | u mail = mail ])
				ifNil: [ 'Erreur: Aucun compte à activer pour cette adresse email. Il est possible que la requête ai expirée.' ]
				ifNotNil: [ :user | self activate: user from: aRequestContext ] ]
		ifAbsent: [ 'Erreur: Requête incorrecte.' ]