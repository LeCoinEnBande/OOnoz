as yet unclassified
inputEntities
	^ (OOAbstractMCQ selectMany: [ :m | m subThemes includes: self subtheme ]) asArray