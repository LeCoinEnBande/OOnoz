rendering
renderContentOn: html
	html heading
		level3;
		with: 'Filtres'.
	html hr.
	self renderKindOptionsOn: html.
	self renderLevelOptionsOn: html.
	self renderStatesOptionsOn: html