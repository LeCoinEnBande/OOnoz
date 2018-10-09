Class {
	#name : #OOMCQFilter,
	#superclass : #OOComponent,
	#instVars : [
		'keepChallenges',
		'keepELearning',
		'levels',
		'keepInactives',
		'keepActives',
		'refreshScript',
		'keepFree',
		'keepProfitables',
		'shouldDisplayState'
	],
	#category : 'OOnoz-WebApplication-Administration-Pages'
}

{ #category : #'instance creation' }
OOMCQFilter class >> refreshScript: aBlock [
	^ self new
		refreshScript: aBlock;
		yourself
]

{ #category : #accessing }
OOMCQFilter >> blockFilters [
	| filters |
	filters := OrderedCollection new.
	self keepChallenges
		ifFalse: [ filters add: [ :coll | coll reject: #isChallenge ] ].
	self keepELearning
		ifFalse: [ filters add: [ :coll | coll reject: #isELearning ] ].
	self keepInactives
		ifFalse: [ filters add: [ :coll | coll reject: #isInactivated ] ].
	self keepActives
		ifFalse: [ filters add: [ :coll | coll reject: #isActivated ] ].
	self keepFree
		ifFalse: [ filters add: [ :coll | coll reject: #isFree ] ].
	self keepProfitables
		ifFalse: [ filters add: [ :coll | coll select: #isFree ] ].
	filters add: [ :coll | coll select: [ :mcq | self levels includes: mcq level ] ].
	^ filters
]

{ #category : #accessing }
OOMCQFilter >> filter: aCollectionOfMCQ [
	^ self blockFilters inject: aCollectionOfMCQ into: [ :res :filter | filter value: res ]
]

{ #category : #initialization }
OOMCQFilter >> initialize [
	super initialize.
	self resetFilters.
	shouldDisplayState := true
]

{ #category : #accessing }
OOMCQFilter >> keepActives [
	^ keepActives
]

{ #category : #accessing }
OOMCQFilter >> keepActives: anObject [
	keepActives := anObject
]

{ #category : #accessing }
OOMCQFilter >> keepChallenges [
	^ keepChallenges
]

{ #category : #accessing }
OOMCQFilter >> keepChallenges: anObject [
	keepChallenges := anObject
]

{ #category : #accessing }
OOMCQFilter >> keepELearning [
	^ keepELearning
]

{ #category : #accessing }
OOMCQFilter >> keepELearning: anObject [
	keepELearning := anObject
]

{ #category : #accessing }
OOMCQFilter >> keepFree [
	^ keepFree
]

{ #category : #accessing }
OOMCQFilter >> keepFree: anObject [
	keepFree := anObject
]

{ #category : #accessing }
OOMCQFilter >> keepInactives [
	^ keepInactives
]

{ #category : #accessing }
OOMCQFilter >> keepInactives: anObject [
	keepInactives := anObject
]

{ #category : #accessing }
OOMCQFilter >> keepProfitables [
	^ keepProfitables
]

{ #category : #accessing }
OOMCQFilter >> keepProfitables: anObject [
	keepProfitables := anObject
]

{ #category : #accessing }
OOMCQFilter >> levels [
	^ levels
]

{ #category : #accessing }
OOMCQFilter >> levels: anObject [
	levels := anObject
]

{ #category : #accessing }
OOMCQFilter >> refreshScript [
	^ refreshScript
]

{ #category : #accessing }
OOMCQFilter >> refreshScript: anObject [
	refreshScript := anObject
]

{ #category : #rendering }
OOMCQFilter >> renderContentOn: html [
	self
		renderKindOptionsOn: html;
		renderLevelOptionsOn: html;
		renderStatesOptionsOn: html;
		renderPriceOptionsOn: html
]

{ #category : #rendering }
OOMCQFilter >> renderKindOptionsOn: html [
	html
		section: [ html heading
				level5;
				with: 'Types'.
			html tbsFormGroup
				class: 'checkbox';
				with: [ html checkbox
						attributeAt: 'autocomplete' put: 'off';
						callback: [ :c | self keepChallenges: c ];
						id: html nextId;
						onChange:
							(html jQuery ajax
								serializeThisCheckbox;
								onSuccess: (self refreshScript value: html));
						value: self keepChallenges.
					html label
						for: html lastId;
						with: 'Challenge' ].
			html tbsFormGroup
				class: 'checkbox';
				with: [ html checkbox
						attributeAt: 'autocomplete' put: 'off';
						callback: [ :c | self keepELearning: c ];
						id: html nextId;
						onChange:
							(html jQuery ajax
								serializeThisCheckbox;
								onSuccess: (self refreshScript value: html));
						value: self keepELearning.
					html label
						for: html lastId;
						with: 'E-leaning' ] ]
]

{ #category : #rendering }
OOMCQFilter >> renderLevelOptionsOn: html [
	html
		section: [ html heading
				level5;
				with: 'Difficultés'.
			html tbsFormGroup
				style: 'min-width: 160px;';
				with: [ html multiSelect
						title: 'Niveaux';
						class: #selectpicker;
						attributeAt: 'autocomplete' put: 'off';
						attributeAt: 'data-width' put: '100%';
						list: (1 to: 5);
						labels: [ :t | 'N.' , t asString ];
						callback: [ :t | self levels: t ];
						onChange:
							(html jQuery ajax
								serializeThisWithHidden;
								onSuccess: (self refreshScript value: html));
						selected: self levels ] ]
]

{ #category : #rendering }
OOMCQFilter >> renderPriceOptionsOn: html [
	html
		section: [ html heading
				level5;
				with: 'Prix'.
			html tbsFormGroup
				class: 'checkbox';
				with: [ html checkbox
						attributeAt: 'autocomplete' put: 'off';
						callback: [ :c | self keepFree: c ];
						id: html nextId;
						onChange:
							(html jQuery ajax
								serializeThisCheckbox;
								onSuccess: (self refreshScript value: html));
						value: self keepFree.
					html label
						for: html lastId;
						with: 'Gratuits' ].
			html tbsFormGroup
				class: 'checkbox';
				with: [ html checkbox
						attributeAt: 'autocomplete' put: 'off';
						callback: [ :c | self keepProfitables: c ];
						id: html nextId;
						onChange:
							(html jQuery ajax
								serializeThisCheckbox;
								onSuccess: (self refreshScript value: html));
						value: self keepProfitables.
					html label
						for: html lastId;
						with: 'Payants' ] ]
]

{ #category : #rendering }
OOMCQFilter >> renderStatesOptionsOn: html [
	self shouldDisplayState ifFalse: [ ^ self ].
	
	html
		section: [ html heading
				level5;
				with: 'États'.
			html tbsFormGroup
				class: 'checkbox';
				with: [ html checkbox
						attributeAt: 'autocomplete' put: 'off';
						callback: [ :c | self keepActives: c ];
						id: html nextId;
						onChange:
							(html jQuery ajax
								serializeThisCheckbox;
								onSuccess: (self refreshScript value: html));
						value: self keepActives.
					html label
						for: html lastId;
						with: 'Actifs' ].
			html tbsFormGroup
				class: 'checkbox';
				with: [ html checkbox
						attributeAt: 'autocomplete' put: 'off';
						callback: [ :c | self keepInactives: c ];
						id: html nextId;
						onChange:
							(html jQuery ajax
								serializeThisCheckbox;
								onSuccess: (self refreshScript value: html));
						value: self keepInactives.
					html label
						for: html lastId;
						with: 'Innactifs' ] ]
]

{ #category : #initialization }
OOMCQFilter >> resetFilters [
	self
		keepChallenges: true;
		keepELearning: true;
		levels: (1 to: 5);
		keepInactives: true;
		keepActives: true;
		keepFree: true;
		keepProfitables: true
]

{ #category : #accessing }
OOMCQFilter >> shouldDisplayState [
	^ shouldDisplayState
]

{ #category : #accessing }
OOMCQFilter >> shouldDisplayState: anObject [
	shouldDisplayState := anObject
]
