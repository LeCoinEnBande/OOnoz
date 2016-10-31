validation
checkDisponibility
	(self class selectOne: [ :user | user mail = self mail ])
		ifNotNil: [ :arg | 
			(OOIndisponibleUser
				modelObject: self
				reason: 'Cet email est déjà utilisé par un autre utilisateur.') signal ]