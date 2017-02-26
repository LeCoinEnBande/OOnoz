tests
testIsAdmin
	user role: OOContributorRole.
	self deny: user isAdmin.
	user role: OOPlayerRole.
	self deny: user isAdmin.
	user role: OOAdminRole.
	self assert: user isAdmin