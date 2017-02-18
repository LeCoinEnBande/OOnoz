rendering
renderContentOn: html
	html heading
		level3;
		with: 'Options'.
	html hr.
	self renderKindOptionsOn: html.
	self renderLevelOptionsOn: html.
	self renderStatesOptionsOn: html