rendering
renderContentOn: html
	self flag: #style.	"Move style to scss"
	html mdlCard
		class: #mcq;
		style: 'width: 90%;margin: 20px auto; background-color: #CFD8DC; ';
		with: [ self renderMCQHeaderOn: html.
			html mdlCardTitle
				class: #mcq__informations;
				with: [ self renderMCQInfosOn: html ].
			html
				mdlCardTextContainer: [ self isValidated
						ifTrue: [ html text: 'QCM fini !' ]
						ifFalse: [ html mdlGrid: [ self questions do: [ :question | html render: question ] ] ] ].
			html mdlCardActions
				border;
				class: #'mcq__validation';
				with: [ self renderValidationButtonOn: html ] ]