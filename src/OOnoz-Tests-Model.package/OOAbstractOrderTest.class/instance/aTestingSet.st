helpers
aTestingSet
	^ (1 to: 200)
		collect: [ :int | 
			| mock |
			mock := Mock new.
			mock stub index willReturn: int.
			mock ]
		as: Set