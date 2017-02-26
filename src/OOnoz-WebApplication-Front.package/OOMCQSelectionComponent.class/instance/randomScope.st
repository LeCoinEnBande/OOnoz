as yet unclassified
randomScope
	^ self mcqFilter filter: (OOAbstractMCQ allActivesFromSubTheme: self subtheme playableBy: self currentUser)