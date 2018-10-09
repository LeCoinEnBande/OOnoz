Class {
	#name : #OOMCQRateTest,
	#superclass : #TestCase,
	#category : 'OOnoz-Tests-Model-Statistics'
}

{ #category : #'instance creation' }
OOMCQRateTest >> newInstance [
	^ (OOMCQRate mcq: OOMCQ new user: OOUser new)
		rate: 3;
		yourself
]

{ #category : #tests }
OOMCQRateTest >> testEquals [
	| instance instance2 |
	instance := self newInstance.
	instance2 := self newInstance.
	self assert: instance = instance2 description: 'The two intances should be equal.'.
	self assert: instance copy = instance description: 'The two instances should be equal'.
	instance2 rate: 1.
	self deny: instance = instance2 description: 'The two intances should not be equal because the second is different.'
]

{ #category : #tests }
OOMCQRateTest >> testIsRated [
	| rate |
	rate := OOMCQRate rate: 4.
	self assert: rate isRated.
	rate rate: nil.
	self deny: rate isRated
]

{ #category : #tests }
OOMCQRateTest >> testRateOf [
	(OOMCQRate stub selectMany: Any)
		willReturn:
			{(OOMCQRate rate: 5).
			(OOMCQRate rate: 0)}.
	self assert: (OOMCQRate rateOf: Any) equals: 2.5.
	OOMCQRate recoverFromGHMutation
]
