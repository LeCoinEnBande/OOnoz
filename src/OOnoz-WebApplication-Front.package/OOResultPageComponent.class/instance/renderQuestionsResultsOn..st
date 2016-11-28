rendering
renderQuestionsResultsOn: html
	self renderGiftAlertOn: html.
	html section
		class: #'panel-group';
		id: #questionsList;
		role: #tablist;
		ariaMultiselectable: true;
		with: [ self mcqResult mcq isChallenge
				ifTrue: [ html text: 'Les réponses ne sont pas disponnibles en mode challenge.' ]
				ifFalse: [ self questions do: [ :q | html render: q ] ].
			html document addLoadScript: self initCheckboxesJs.
			html
				section: [ html div
						tbsPullRight;
						with: [ self renderButtonsOn: html ] ] ]