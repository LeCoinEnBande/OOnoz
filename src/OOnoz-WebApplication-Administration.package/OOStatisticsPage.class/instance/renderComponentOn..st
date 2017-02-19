rendering
renderComponentOn: html
	html tbsRow: [ html tbsColMs: 10 mo: 1 with: [ self selectedChart ifNil: [ self renderPossibilitiesOn: html ] ifNotNil: [ :c | html render: c ] ] ]