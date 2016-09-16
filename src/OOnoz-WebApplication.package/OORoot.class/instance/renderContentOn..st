rendering
renderContentOn: html
	html mdlLayout
		fixedHeader;
		with: [ html render: self header.
			(html tag: #main) with: [ html render: 'foo'	"self component" ].
			html render: self footer ]