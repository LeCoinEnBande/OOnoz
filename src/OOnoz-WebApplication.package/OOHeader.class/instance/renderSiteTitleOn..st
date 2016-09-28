rendering
renderSiteTitleOn: html
	html anchor
		callback: [ self displayDefaultScreen ];
		with: [ html mdlLayoutTitle: 'OOnoz' ]