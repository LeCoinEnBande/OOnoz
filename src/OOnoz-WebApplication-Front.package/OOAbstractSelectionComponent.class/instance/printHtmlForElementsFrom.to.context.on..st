rendering
printHtmlForElementsFrom: start to: end context: aContext on: aStream
	| document |
	document := (WAHtmlDocument on: aStream codec: GRNullCodec new)
		scriptGenerator: WADefaultScriptGenerator new;
		yourself.
	aContext document: document.
	(WAHtmlCanvas context: aContext)
		render: [ :htmlDyn | 
			(start < self entitiesCached size and: [ end >= 1 ])
				ifTrue: [ self entitiesCached
						from: (start max: 1)
						to: (end min: self entitiesCached size)
						do: [ :anElement | anElement renderForSearchOf: self on: htmlDyn ] ] ];
		flush.
	document scriptGenerator closeOn: document