handling
activate: user from: aRequestContext
	^ aRequestContext request
		at: 'value'
		ifPresent: [ :value | 
			value = user mail hash asString
				ifTrue: [ user
						activate;
						save.
					'Succés: Votre compte a bien été activé.' ]
				ifFalse: [ 'Erreur: La requête est fausse. Vérifié que votre lien correspond au lien envoyé.' ] ]
		ifAbsent: [ 'Erreur: Requête incorrecte.' ]