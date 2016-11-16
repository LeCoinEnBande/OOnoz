rendering
renderNavbarContentOn: html
	| id |
	id := #mainNavbar.
	html
		tbsNavbarHeader: [ self renderNavToogleFor: id on: html.
			self renderLogoOn: html ].
	html tbsNavbarCollapse
		id: id;
		with: [ html unorderedList
				class: #'nav navbar-nav navbar-right';
				with: [ self renderMenuOn: html ] ]