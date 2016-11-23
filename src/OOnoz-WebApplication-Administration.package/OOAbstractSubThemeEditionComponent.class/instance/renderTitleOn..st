rendering
renderTitleOn: html
	html
		tbsContainer: [ html heading
				class: #'page-header';
				with: self title ]