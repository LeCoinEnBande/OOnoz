rendering
renderMenuOn: html
	super renderMenuOn: html.
	self renderUserMenuOn: html.
		 self currentUser displayName -> OOProfilePage