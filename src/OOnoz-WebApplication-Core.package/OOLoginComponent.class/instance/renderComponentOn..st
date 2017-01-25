rendering
renderComponentOn: html
	self isLogged
		ifFalse: [ html form
				class: #'text-center';
				with: [ self renderFormContentOn: html.
					html hr.
					self renderButtonOn: html ] ]
		ifTrue: [ html text: 'Bienvenu'.
			html break.
			html tbsAnchor
				callback: [ self rootComponent setInstanceOf: OOPlayPage ];
				beSuccess;
				with: 'Continuer' ]