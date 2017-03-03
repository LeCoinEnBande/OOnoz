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
						text:
							(String
								streamContents: [ :s | 
									s
										<< self currentUser displayName;
										<< ' (';
										<< self currentUser credits;
										<< 'C)' ]);
						tbsCaret ].
			html
				tbsDropdownMenu: [ html
						tbsDropdownMenuItem: [ html anchor
								callback: [ self moveToPage: OOProfilePage ];
								with: 'Voir mon profil' ];
						tbsDropdownMenuItem: [ html anchor
								callback: [ self moveToPage: OORechargePage ];
								with: 'Recharger des crédits' ];
						tbsDivider;
						tbsDropdownMenuItem: [ html anchor
								callback: [ self logout ];
								with: 'Se déconnecter' ];
						tbsDivider;
						tbsDropdownMenuItem: [ html anchor
								callback: [ self logout ];
								url: '/OOnozAdministration';
								with: 'Basculer Collaborateur' ] ] ]