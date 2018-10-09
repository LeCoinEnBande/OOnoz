Class {
	#name : #OOFrontHeader,
	#superclass : #OOAbstractHeader,
	#category : 'OOnoz-WebApplication-Front-Core'
}

{ #category : #accessing }
OOFrontHeader >> navContentMap [
	| pages |
	pages := OrderedDictionary with: 'À propos' -> OOWelcomePage with: 'Aide' -> OOHelpPage.
	self isLogged
		ifTrue: [ pages at: 'Jouer' put: OOPlayPage ]
		ifFalse: [ pages at: 'Inscription' put: OOSubscriptionPage ].
	^ pages
]

{ #category : #rendering }
OOFrontHeader >> renderLoginDialogOn: html [
	self isLogged
		ifTrue: [ ^ self ].
		
	html tbsNavItem
		style: 'cursor: pointer;';
		onClickUpdateRootDialogWith: [ :canvas | (self rootComponent instanceOf: OOWelcomePage) renderLoginModalOn: canvas ];
		with: 'Connexion'
]

{ #category : #rendering }
OOFrontHeader >> renderMenuOn: html [
	super renderMenuOn: html.
	self renderUserMenuOn: html.
	self renderLoginDialogOn: html
]

{ #category : #rendering }
OOFrontHeader >> renderUserMenuOn: html [
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
]
