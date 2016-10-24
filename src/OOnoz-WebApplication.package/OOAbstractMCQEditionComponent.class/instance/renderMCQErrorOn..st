rendering
renderMCQErrorOn: html
	self hasBeenValidated
		ifFalse: [ ^ self ].
	self flag: #todo.	"Double caching is not really good. I tihnk we can do better."
	[ [ self mcq validate ]
		on: OOInvalidMCQ
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'Le QCM n''est pas valide ! '.
					html text: e reason ] ] ]
		on: OOInvalidQuestion
		do: [  ]