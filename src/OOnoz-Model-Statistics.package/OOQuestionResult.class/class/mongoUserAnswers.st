as yet unclassified
mongoUserAnswers
	<mongoDescription>
	^ VOToOneDescription new
		attributeName: 'userAnswers';
		accessor:
			(MAPluggableAccessor
				read: [ :res | (res userAnswers associations collect: [ :asso | asso key index asString -> asso value ]) asDictionary ]
				write: [ :res :dico | res userAnswers: (dico associations collect: [ :asso | (self question answers detect: [ :a | a index asString = asso key ]) -> asso value ]) asDictionary ]);
		yourself