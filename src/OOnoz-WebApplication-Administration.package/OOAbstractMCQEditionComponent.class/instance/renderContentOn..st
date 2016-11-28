rendering
renderContentOn: html
	self renderTitleOn: html.
	html
		tbsContainer: [ html section
				class: #'panel-group';
				id: #mcqCreation;
				role: #tablist;
				ariaMultiselectable: true;
				with: [ html
						form: [ self renderMCQFormsOn: html.
							self questionComponents asArray sort do: [ :comp | html render: comp ].
							self renderButtonsOn: html ] ].
			self renderCancelModalFor: html lastId on: html ].
	html document addLoadScript: '$("input.slider").slider();' js