rendering
renderHeaderOn: html
	html tableRow: [ self columns do: [ :title | html tableHeading: title ] ]