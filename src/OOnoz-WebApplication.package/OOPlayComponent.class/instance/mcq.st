accessing
mcq
	self flag: #clean.
	^ mcq ifNil: [ mcq := OOMCQ selectOne: [ :u | true ] ]