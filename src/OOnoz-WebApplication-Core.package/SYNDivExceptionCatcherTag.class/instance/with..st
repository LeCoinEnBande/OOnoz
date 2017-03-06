accessing
with: anObject
	[ super with: anObject ]
		on: Error
		do: [ :anError | canvas render: 'Error : ' , anError asString ]