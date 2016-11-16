rendering
renderUserMenuOn: html
	self isLogged
		ifFalse: [ ^ self ].
	html tbsNavItem
		tbsDropdown: [ html tbsDropdownAnchor
				url: '#';
				role: #button;
				ariaHaspopup: true;
				with: [ html
						text: self currentUser displayName;
						tbsCaret ].
			html
				tbsDropdownMenu: [ html
						tbsDropdownMenuItem: [ html anchor
								callback: [ self moveToPage: OOCommunitiesPage ];
								with: 'Mes communautés' ];
						tbsDropdownMenuItem: [ html anchor
								callback: [ self moveToPage: OOPlayedMCQsPage ];
								with: 'Mes questionnaires joués' ];
						tbsDivider;
						tbsDropdownMenuItem: [ html anchor
								callback: [ self moveToPage: OOProfilePage ];
								with: 'Voir mon profil' ];
						tbsDivider;
						tbsDropdownMenuItem: [ html anchor
								callback: [ self logout ];
								with: 'Se déconnecter' ] ] ]