rendering
renderHeaderOn: html
	html
		tableRow: [ html tableHeading attributeAt: 'data-checkbox' put: 'true'.
			self columns do: [ :title | html tableHeading: title ] ]