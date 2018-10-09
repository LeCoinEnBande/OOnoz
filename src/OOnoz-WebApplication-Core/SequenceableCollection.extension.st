Extension { #name : #SequenceableCollection }

{ #category : #'*OOnoz-WebApplication-Core' }
SequenceableCollection >> sortByDisplayName [
	^ self sort: [ :a :b | a displayName < b displayName ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
SequenceableCollection >> sortByTitle [
	^ self sort: [ :a :b | a title < b title ]
]
