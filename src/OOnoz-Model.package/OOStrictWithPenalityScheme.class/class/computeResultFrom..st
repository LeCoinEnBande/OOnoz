result
computeResultFrom: aCollection
	^ aCollection associations
		detect: [ :association | association key isRight ~= association value ]
		ifFound: [ -1 ]
		ifNone: [ 1 ]