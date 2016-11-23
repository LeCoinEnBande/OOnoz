rendering
renderContentOn: html
	html tbsContainer
		class: 'text-center';
		with: [ self renderTitleAndDescriptionOn: html.
			html hr.
			html
				form: [ self renderMCQFormsOn: html.
					self questionComponents asArray sort do: [ :comp | html render: comp ].
					html hr.
					html tbsContainer
						class: #'text-center';
						with: [ self renderButtonsOn: html ] ].
			self renderCancelModalFor: html lastId on: html ].
	html document addLoadScript: '$("input.slider").slider();' js