rendering
renderSearchOptionsOn: html
	html tbsRow: [ html tbsColMs: 10 mo: 1 with: [ html tbsWell: [ html heading level5; with: 'Options de recherche'. self randomScope ifNotEmpty: [ :scope | html render: (OORandomButton scope: scope page: self page) ] ] ] ]