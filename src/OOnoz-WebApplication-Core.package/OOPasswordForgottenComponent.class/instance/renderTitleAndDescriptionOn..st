rendering
renderTitleAndDescriptionOn: html
	html header
		beCentered;
		with: [ html heading
				level3;
				with: self title ]