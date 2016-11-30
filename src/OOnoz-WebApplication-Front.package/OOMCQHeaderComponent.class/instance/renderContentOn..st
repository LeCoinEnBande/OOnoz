rendering
renderContentOn: html
	html
		tbsPageHeader: [ html
				heading: [ html text: self mcq title.
					html space.
					html hiddenInput
						class: #rating;
						id: html nextId;
						attributeAt: 'data-fractions' put: 2;
						readOnly;
						value: (OOMCQRate rateOf: self mcq) ].
			html document addLoadScript: ('$("#' , html lastId , '").rating()') js.
			self renderLabelsOn: html ]