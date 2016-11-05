rendering
renderContentOn: html
	| id |
	self renderTitleAndDescriptionOn: html.
	html hr.
	html
		form: [ self renderMCQFormsOn: html.
			self questionComponents asArray sort do: [ :comp | html render: comp ].
			html hr.
			html tbsContainer
				class: #'text-center';
				with: [ self renderButtonsOn: html.
					html space.
					html tbsButton
						bePush;
						beDanger;
						beOutline;
						dataToggle: 'modal';
						dataTarget: '#' , (id := html nextId);
						with: 'Annuler' ] ].
	self renderCancelModalFor: id on: html.
	html document addLoadScript: ' $(''[data-toggle="tooltip"]'').tooltip()' js