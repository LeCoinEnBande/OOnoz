rendering
renderComponentOn: html
	html
		tbsContainer: [ html
				tbsRow: [ html tbsColumn
						mediumSize: 10;
						mediumOffset: 1;
						with: [ html
								form: [ html
										tbsPanelGroupId: #mcqCreation
										with: [ self renderMCQFormsOn: html.
											self questionComponents asArray sort do: [ :comp | html render: comp ].
											self renderButtonsOn: html ] ] ] ] ].
	self renderCancelModalOn: html.
	html document addLoadScript: '$("input.slider").slider();' js.
	html document addLoadScript: self initQuestionsScript