rendering
renderContentOn: html
	html
		header: [ html tbsNavbar
				beDefault;
				beFixedTop;
				with: [ html tbsContainer: [ self renderNavbarContentOn: html ] ] ]