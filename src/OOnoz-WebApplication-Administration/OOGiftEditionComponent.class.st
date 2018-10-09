Class {
	#name : #OOGiftEditionComponent,
	#superclass : #OOComponent,
	#instVars : [
		'owner'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #'instance creation' }
OOGiftEditionComponent class >> owner: aComponent [
	^ self new
		owner: aComponent;
		yourself
]

{ #category : #accessing }
OOGiftEditionComponent >> gift [
	^ self mcq gift
]

{ #category : #accessing }
OOGiftEditionComponent >> gift: aGift [
	^ self mcq gift: aGift
]

{ #category : #accessing }
OOGiftEditionComponent >> mcq [
	^ self owner mcq
]

{ #category : #accessing }
OOGiftEditionComponent >> owner [
	^ owner
]

{ #category : #accessing }
OOGiftEditionComponent >> owner: anObject [
	owner := anObject
]

{ #category : #rendering }
OOGiftEditionComponent >> renderContentOn: html [
	html div
		id: #gift;
		with: [ self renderGiftContentOn: html ]
]

{ #category : #rendering }
OOGiftEditionComponent >> renderFormOn: html [
	self mcq hasGift
		ifFalse: [ ^ self ].
	html
		tbsFormGroup: [ | label |
			label := 'Description du cadeau'.
			html label
				for: html nextId;
				tbsScreenReaderOnly;
				with: label.
			html textArea
				tbsFormControl;
				id: html lastId;
				placeholder: label;
				callback: [ :gift | self gift description: gift ];
				value: self gift description;
				rows: 1 ].
	html
		tbsFormGroup: [ | label |
			label := 'Nombre de cadeaux'.
			html label
				for: html nextId;
				tbsScreenReaderOnly;
				with: label.
			html numberInput
				tbsFormControl;
				id: html lastId;
				placeholder: label;
				min: 1;
				callback: [ :number | self gift number: number asInteger ];
				value: self gift number ]
]

{ #category : #rendering }
OOGiftEditionComponent >> renderGiftContentOn: html [
	html
		tbsFormGroup: [ html tbsButton
				beInfoIf: self mcq hasGift not;
				beDangerIf: self mcq hasGift;
				bePush;
				onClick:
					((html jQuery id: #gift) load
						html: [ :r | 
							self toggleGift.
							self renderGiftContentOn: html ]);
				with:
					(self mcq hasGift
						ifTrue: [ 'Supprimer le cadeau' ]
						ifFalse: [ 'Ajouter un cadeau' ]) ].
	self renderFormOn: html
]

{ #category : #action }
OOGiftEditionComponent >> toggleGift [
	self mcq hasGift
		ifTrue: [ self mcq resetGift ]
		ifFalse: [ self mcq gift: OOGift new ]
]
