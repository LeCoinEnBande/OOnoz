accessing
price: anInteger
	^ self mcq ifNotNil: [ :m | m price: anInteger ]