Class {
	#name : #OOMCQHeaderComponent,
	#superclass : #OOComponent,
	#instVars : [
		'mcq'
	],
	#category : 'OOnoz-WebApplication-Front-Components'
}

{ #category : #'instance creation' }
OOMCQHeaderComponent class >> mcq: aMCQ [
	^ self new
		mcq: aMCQ;
		yourself
]

{ #category : #accessing }
OOMCQHeaderComponent >> mcq [
	^ mcq
]

{ #category : #accessing }
OOMCQHeaderComponent >> mcq: anObject [
	mcq := anObject
]

{ #category : #rendering }
OOMCQHeaderComponent >> renderContentOn: html [
	html
		tbsPageHeader: [ html
				heading: [ html text: self mcq title.
					html space.
					html hiddenInput
						class: #rating;
						id: html nextId;
						attributeAt: 'data-fractions' put: 2;
						readOnly;
						value: (OOMCQRate rateOf: self mcq) ].
			html document addLoadScript: ('$("#' , html lastId , '").rating()') js.
			self renderLabelsOn: html ]
]

{ #category : #rendering }
OOMCQHeaderComponent >> renderLabelsOn: html [
	self mcq renderThemeAndSubThemesOn: html.
	html space.
	html tbsLabel
		beSuccess;
		with: self mcq orderer label.
	html space.
	html tbsLabel
		beInfo;
		with:
			self mcq price greaseString , ' crédit'
				,
					(self mcq price > 1
						ifTrue: [ 's' ]
						ifFalse: [ '' ]).
	html space.
	html tbsLabel
		beDefault;
		class: 'label-difficulty-' , self mcq level asString;
		with: 'Niveau ' , self mcq level asString
]
