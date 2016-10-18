rendering
renderContentOn: html
	html render: self header.
	(html tag: #main) with: [ html render: self component ]