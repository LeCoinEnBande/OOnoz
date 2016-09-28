rendering
renderContentOn: html
	html mdlLayout
		fixedHeader;
		with: [ html render: self header.
			(html tag: #main) with: [ html render: self component ].
			html render: self footer ]