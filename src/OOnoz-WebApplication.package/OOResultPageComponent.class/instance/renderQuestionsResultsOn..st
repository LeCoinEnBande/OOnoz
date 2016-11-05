rendering
renderQuestionsResultsOn: html
	html section
		class: #'panel-group';
		id: #questionsList;
		role: #tablist;
		ariaMultiselctable: true;
		with: [ self questions do: [ :q | html render: q ] ].
	html document addLoadScript: self initCheckboxesJs.
	html
		section: [ html div
				tbsPullRight;
				with: [ self renderButtonsOn: html ] ]