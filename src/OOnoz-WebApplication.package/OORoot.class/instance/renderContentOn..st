rendering
renderContentOn: html
	html render: self header.
	(html tag: #main) with: [ html tbsContainer: [ html render: self component ] ]