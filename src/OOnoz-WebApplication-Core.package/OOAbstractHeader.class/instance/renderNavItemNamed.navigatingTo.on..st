rendering
renderNavItemNamed: aString navigatingTo: aComponentClass on: html
	html tbsNavItem
		beActiveIf: (self isTheActiveClass: aComponentClass);
		with: [ html anchor
				callback: [ self moveToPage: aComponentClass ];
				with:
					((aString = 'Questionnaires' and: [ self currentUser isAdmin ])
						ifTrue: [ [ | count |
							count := OOAbstractMCQ count: [ :m | m state = #undefined ].
							html text: aString.
							html space.
							count = 0
								ifFalse: [ html tbsBadge: count asString ] ] ]
						ifFalse: [ aString ]) ]