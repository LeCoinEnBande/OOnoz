rendering
renderContentOn: html
	self renderTitleAndDescriptionOn: html.
	html hr.
	html
		form: [ self renderMCQFormsOn: html.
			self questionComponents sort do: [ :comp | html render: comp ].
			html hr.
			self renderValidationButtonOn: html ].
	html anchor
		callback: [ self answer: false ];
		with: [ html tbsButton
				beOutline;
				beDanger;
				with: 'Annuler' ]