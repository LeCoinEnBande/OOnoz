Class {
	#name : #OOUserTest,
	#superclass : #TestCase,
	#instVars : [
		'user'
	],
	#category : 'OOnoz-Tests-Model'
}

{ #category : #accessing }
OOUserTest >> actualClass [
	^ OOUser
]

{ #category : #'instance creation' }
OOUserTest >> newInstance [
	^ self actualClass new
		firstName: 'Aurélien';
		lastName: 'Rousseau';
		mail: 'pingu@gmail.com';
		password: 'ATestPass012#';
		birthday: (Date year: 1990 month: 01 day: 01);
		beOtherGender;
		country: 'France';
		state: 'Hauts-de-France';
		city: 'Lille';
		zip: '59000';
		address: '01 rue Jean Jaures';
		yourself
]

{ #category : #running }
OOUserTest >> setUp [
	super setUp.
	user := self newInstance
]

{ #category : #tests }
OOUserTest >> testActivate [
	user desactivate.
	self deny: user isActivated.
	user activate.
	self assert: user isActivated
]

{ #category : #tests }
OOUserTest >> testAddCredits [
	user credits: 20.
	self assert: user credits equals: 20.
	user addCredits: 35.
	self assert: user credits equals: 55
]

{ #category : #tests }
OOUserTest >> testAddMCQ [
	| size |
	size := user mcqs size.
	user addMCQ: Mock new.
	self assert: user mcqs size equals: size + 1
]

{ #category : #tests }
OOUserTest >> testBeFemale [
	user beOtherGender.
	self deny: user gender = #female.
	user beFemale.
	self assert: user gender equals: #female
]

{ #category : #tests }
OOUserTest >> testBeMale [
	user beOtherGender.
	self deny: user gender = #male.
	user beMale.
	self assert: user gender equals: #male
]

{ #category : #tests }
OOUserTest >> testBeOtherGender [
	user beMale.
	self deny: user gender = #other.
	user beOtherGender.
	self assert: user gender equals: #other
]

{ #category : #tests }
OOUserTest >> testCannotChangePassword [
	self should: [ user mail: 'other@gmail.com' ] raise: OOError
]

{ #category : #tests }
OOUserTest >> testCheckDisponibility [
	SystemVersion current major = 4 ifTrue: [ self skip ].
	[ (user class stub selectOne: Any) willReturn: user.
	self should: [ user checkDisponibility ] raise: OOUnavailableUser.
	(user class stub selectOne: Any) willReturn: nil.
	self shouldnt: [ user checkDisponibility ] raise: OOUnavailableUser ]
		ensure: [ user class recoverFromGHMutation ]
]

{ #category : #tests }
OOUserTest >> testCipher [
	self assert: user password equals: '4976621c376e7e64ec2f4937201a470bb4cfa06b89e109d13d354f45bbe8ddec'
]

{ #category : #tests }
OOUserTest >> testCreateMomento [
	| memento |
	memento := user createMemento.
	self assert: memento equals: user.
	user directMail: 'test'.
	self deny: memento = user
]

{ #category : #tests }
OOUserTest >> testDesactivate [
	user activate.
	self assert: user isActivated.
	user desactivate.
	self deny: user isActivated
]

{ #category : #tests }
OOUserTest >> testEquals [
	| instance2 |
	instance2 := self newInstance.
	self assert: user = instance2 description: 'The two intances should be equal.'.
	self assert: user copy = user description: 'The two instances should be equal'.
	instance2 directMail: 'otherMail@gmail.com'.
	self deny: user = instance2 description: 'The two intances should not be equal because the second one has not the same mail.'
]

{ #category : #tests }
OOUserTest >> testHash [
	| instance2 |
	instance2 := self newInstance.
	self assert: user hash equals: user copy hash.
	self assert: user hash equals: instance2 hash
]

{ #category : #tests }
OOUserTest >> testIsAdmin [
	user role: OOContributorRole.
	self deny: user isAdmin.
	user role: OOPlayerRole.
	self deny: user isAdmin.
	user role: OOAdminRole.
	self assert: user isAdmin
]

{ #category : #tests }
OOUserTest >> testPassword [
	| password |
	password := 'ATestPassword092«'.
	user password: password.
	self deny: user password = password
]

{ #category : #tests }
OOUserTest >> testPasswordMatch [
	| password |
	password := 'ATestPassword092«'.
	user password: password.
	self assert: (user passwordMatch: password)
]

{ #category : #tests }
OOUserTest >> testPasswordShouldNeedMail [
	user directMail: nil.
	self should: [ user password: 'ATestPasswordToTry3210/' ] raise: OOError
]

{ #category : #tests }
OOUserTest >> testRestoreFromMemento [
	| memento |
	memento := user createMemento.
	user directMail: 'test'.
	self deny: memento = user.
	user restoreFromMemento: memento.
	self assert: user equals: memento
]

{ #category : #tests }
OOUserTest >> testUserNeedAddress [
	user address: nil.
	self should: [ user validate ] raise: OOInvalidUser 
]

{ #category : #tests }
OOUserTest >> testUserNeedCity [
	user city: nil.
	self should: [ user validate ] raise: OOInvalidUser 
]

{ #category : #tests }
OOUserTest >> testUserNeedCountry [
	user country: nil.
	self should: [ user validate ] raise: OOInvalidUser 
]

{ #category : #tests }
OOUserTest >> testUserNeedFirstName [
	user firstName: nil.
	self should: [ user validate ] raise: OOInvalidUser 
]

{ #category : #tests }
OOUserTest >> testUserNeedLastName [
	user directPassword: nil.
	self should: [ user validate ] raise: OOInvalidUser 
]

{ #category : #tests }
OOUserTest >> testUserNeedMail [
	user directMail: nil.
	self should: [ user validate ] raise: OOInvalidUser 
]

{ #category : #tests }
OOUserTest >> testUserNeedPassword [
	user directPassword: nil.
	self should: [ user validate ] raise: OOInvalidUser 
]

{ #category : #tests }
OOUserTest >> testUserNeedState [
	user state: nil.
	self should: [ user validate ] raise: OOInvalidUser 
]

{ #category : #tests }
OOUserTest >> testUserNeedZip [
	user zip: nil.
	self should: [ user validate ] raise: OOInvalidUser 
]

{ #category : #tests }
OOUserTest >> testValidate [
	self shouldnt: [ user validate ] raise: OOInvalidUser
]
