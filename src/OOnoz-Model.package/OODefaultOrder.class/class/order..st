accessing
order: aCollection 
	^ aCollection sorted: [ :a :b | a index < b index ]