rendering
renderContentOn: html
	self renderTitleAndDescriptionOn: html.
	html hr.
	html
		form: [ self renderMCQFormsOn: html.
			(self mcq questions asArray sort: [ :a :b | a index < b index ]) do: [ :aQuestion | self renderQuestionFormFor: aQuestion on: html ].
			html hr.
			self renderValidationButtonOn: html ].
	html anchor
		callback: [ self answer: false ];
		with: [ html tbsButton
				beOutline;
				beDanger;
				with: 'Annuler' ]