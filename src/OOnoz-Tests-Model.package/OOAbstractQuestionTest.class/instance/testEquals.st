tests
testEquals
	| instance2 |
	instance2 := self newQuestionInstance.
	self assert: question = instance2 description: 'The two intances should be equal.'.
	self assert: question copy = question description: 'The two instances should be equal'.
	instance2 media: 'Add a media'.
	self deny: question = instance2 description: 'The two intances should not be equal because the second one has one more answer.'