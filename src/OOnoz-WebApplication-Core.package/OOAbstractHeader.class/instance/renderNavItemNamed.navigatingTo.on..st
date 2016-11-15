rendering
renderNavItemNamed: aString navigatingTo: aComponentClass on: html
	html tbsNavItem
		beActiveIf: (self isTheActiveClass: aComponentClass);
		with: [ html anchor
				callback: [ self rootComponent setInstanceOf: aComponentClass ];
				with: aString ]