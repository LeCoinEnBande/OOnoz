as yet unclassified
inputEntities
	^ self mcqFilter filter: (OOAbstractMCQ selectMany: [ :m | m subThemes includes: self subtheme ]) asArray