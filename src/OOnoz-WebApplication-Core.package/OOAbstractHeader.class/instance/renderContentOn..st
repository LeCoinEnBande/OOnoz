rendering
renderContentOn: html
	html header
		class: 'jumbotron' if: self rootComponent component class shouldShowJumbotron;
		with: [ html tbsNavbar
				beDefault;
				beFixedTop;
				with: [ html tbsContainer: [ self renderNavbarContentOn: html ] ] ]