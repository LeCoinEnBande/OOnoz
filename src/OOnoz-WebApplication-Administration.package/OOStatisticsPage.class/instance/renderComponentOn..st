rendering
renderComponentOn: html
	html tbsContainer: [ self selectedChart ifNil: [ self renderPossibilitiesOn: html ] ifNotNil: [ :c | html render: c ] ]