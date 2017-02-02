rendering
renderUserMenuOn: html
	html tbsNavItem
		tbsDropdown: [ html tbsDropdownAnchor
				url: '#';
				role: #button;
				ariaHaspopup: true;
				with: [ html
						text: self currentUser displayName , ' (' , self currentUser role displayName , ')';
						tbsCaret ].
			html
				tbsDropdownMenu: [ html
						tbsDropdownMenuItem: [ html anchor
								callback: [ self moveToPage: OOProfilePage ];
								with: 'Voir mon profil' ];
						tbsDivider;
						tbsDropdownMenuItem: [ html anchor
								callback: [ self logout ];
								with: 'Se déconnecter' ];
						tbsDivider;
						tbsDropdownMenuItem: [ html anchor
								callback: [ self logout ];
								url: '/OOnoz';
								with: 'Basculer joueur' ] ] ]