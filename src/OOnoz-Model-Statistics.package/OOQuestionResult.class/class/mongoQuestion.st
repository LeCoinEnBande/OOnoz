as yet unclassified
mongoQuestion
	<mongoDescription>
	^ VOToOneDescription new
		attributeName: 'question';
		accessor: (MAPluggableAccessor read: [ :res | res question index ] write: [ :res :index | res question: (res owner mcq questions detect: [ :q | q index = index ]) ]);
		yourself