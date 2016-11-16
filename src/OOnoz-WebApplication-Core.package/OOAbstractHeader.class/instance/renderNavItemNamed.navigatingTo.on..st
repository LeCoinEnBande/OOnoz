rendering
renderNavItemNamed: aString navigatingTo: aComponentClass on: html
	html tbsNavItem
		beActiveIf: (self isTheActiveClass: aComponentClass);
		with: [ html anchor
				callback: [ self moveToPage: aComponentClass ];
				with: aString ]