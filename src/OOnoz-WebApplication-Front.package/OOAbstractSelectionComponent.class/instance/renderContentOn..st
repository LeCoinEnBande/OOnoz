rendering
renderContentOn: html
	self resetCache.
	html
		tbsContainer: [ self
				renderSteperOn: html;
				renderSearchFieldOn: html.
			self entitiesCached ifNotEmpty: [ self renderSearchOptionsOn: html ].
			self renderEntitiesCardsOn: html.
			self entitiesCached ifEmpty: [ html text: 'Désolé mais cette catégorie est actuellement vide.' ] ].
	html document addLoadScript: '$(window).scrollTop(0)' js