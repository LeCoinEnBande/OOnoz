result
computeResultFrom: aCollection
	^ aCollection associations
		detect: [ :association | association key isRight ~= association value ]
		ifFound: [ 0 ]
		ifNone: [ 1 ]