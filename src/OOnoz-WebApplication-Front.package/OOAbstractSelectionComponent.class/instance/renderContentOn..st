rendering
renderContentOn: html
	self resetCache.
	html
		tbsContainer: [ self
				renderSteperOn: html;
				renderSearchFieldOn: html.
			self renderSearchOptionsOn: html.
			self renderEntitiesCardsOn: html.
			self entitiesCached
				ifEmpty: [ html tbsAlert
						beWarning;
						with: 'Désolé mais nous n''avons pas encore de QCMs satisfaisant votre recherche.' ] ].
	html document addLoadScript: '$(window).scrollTop(0)' js