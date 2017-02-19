*OOnoz-WebApplication-Core
avatarUrlFrom: aConfiguration
	^ aConfiguration avatarsURL
		,
			(self hasAvatar
				ifFalse: [ 'default.png' ]
				ifTrue: [ self mail , '.png' ])