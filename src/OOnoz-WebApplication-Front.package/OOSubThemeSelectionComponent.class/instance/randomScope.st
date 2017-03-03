as yet unclassified
randomScope
	| u |
	u := self currentUser.
	^ OOAbstractMCQ allActivesFromTheme: self theme playableBy: self currentUser