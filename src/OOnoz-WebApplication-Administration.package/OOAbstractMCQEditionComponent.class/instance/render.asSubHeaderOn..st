rendering
render: aString asSubHeaderOn: html
	html tbsContainer
		class: #'text-center';
		with: [ html heading
				level2;
				class: #h5;
				with: aString ]