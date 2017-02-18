as yet unclassified
mcqInput
	^ self mcqInputCache
		ifNil: [ self mcqInputCache: (self mcqFilter filter: OOAbstractMCQ selectAll).
			self mcqInputCache ]