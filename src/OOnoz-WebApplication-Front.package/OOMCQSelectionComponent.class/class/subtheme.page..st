instance creation
subtheme: aSubTheme page: aComponent
	^ self new
		subtheme: aSubTheme;
		page: aComponent;
		yourself