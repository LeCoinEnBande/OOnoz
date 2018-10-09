Class {
	#name : #OOShippingMCQComponent,
	#superclass : #OOComponent,
	#instVars : [
		'mcq',
		'index'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #'instance creation' }
OOShippingMCQComponent class >> mcq: aMCQ index: anIndex [
	^ self new
		mcq: aMCQ;
		index: anIndex;
		yourself
]

{ #category : #accessing }
OOShippingMCQComponent >> columns [
	^ #('Utilisateur' 'Adresse' 'Ville' 'Région' 'Pays' 'Email')
]

{ #category : #accessing }
OOShippingMCQComponent >> id [
	^ 'Challenge' , self index greaseString
]

{ #category : #accessing }
OOShippingMCQComponent >> index [
	^ index
]

{ #category : #accessing }
OOShippingMCQComponent >> index: anObject [
	index := anObject
]

{ #category : #accessing }
OOShippingMCQComponent >> mcq [
	^ mcq
]

{ #category : #accessing }
OOShippingMCQComponent >> mcq: anObject [
	mcq := anObject
]

{ #category : #rendering }
OOShippingMCQComponent >> renderBadgeOn: html [
	| finished |
	finished := self mcq gift winners size.
	html tbsBadge
		beSuccessIf: finished = self mcq gift number;
		beDangerIf: finished ~= self mcq gift number;
		with: finished greaseString , '/' , self mcq gift number greaseString
]

{ #category : #rendering }
OOShippingMCQComponent >> renderContentOn: html [
	self flag: #todo.	"The active panel should be kept"
	self renderPanelHeaderOn: html.
	html div
		id: self id;
		class: #'panel-collapse';
		class: #collapse;
		class: #in if: self index = 1;
		role: #tabpanel;
		ariaLabelledBy: self titleId;
		with: [ html section
				class: #'panel-body';
				with: [ html
						section: [ self renderToolbarOn: html.
							html tbsTable
								class: #'table-no-bordered';
								attributeAt: #'data-toggle' put: 'table';
								attributeAt: #'data-search' put: 'true';
								attributeAt: #'data-pagination' put: 'true';
								attributeAt: 'data-toolbar' put: '#' , self toolbarId;
								with: [ html tableHead: [ self renderTableHeaderOn: html ].
									html
										tableBody: [ self mcq gift winners
												do: [ :user | html tableRow: [ (self tableEntriesFrom: user on: html) do: [ :content | html tableData: content ] ] ] ] ] ] ] ]
]

{ #category : #rendering }
OOShippingMCQComponent >> renderPanelHeaderOn: html [
	html tbsArticlePanelHeader
		id: self titleId;
		parent: #'#mcqsList';
		toggle: #collapse;
		target: self id;
		ariaExpanded: self index = 1;
		ariaControles: self id;
		with: [ html tbsPanelTitle
				level3;
				with: [ html text: 'Challenge: ' , self mcq title.
					html div
						tbsPullRight;
						class: #'oonoz-badges';
						with: [ self renderBadgeOn: html ] ] ]
]

{ #category : #rendering }
OOShippingMCQComponent >> renderTableHeaderOn: html [
	html tableRow: [ self columns do: [ :title | html tableHeading: title ] ]
]

{ #category : #rendering }
OOShippingMCQComponent >> renderToolbarOn: html [
	html section id: self toolbarId
]

{ #category : #'as yet unclassified' }
OOShippingMCQComponent >> tableEntriesFrom: aUser on: html [
	^ {aUser displayName.
	aUser address.
	aUser city.
	aUser state.
	aUser country.
	aUser mail}
]

{ #category : #rendering }
OOShippingMCQComponent >> titleId [
	^ 'ChallengTitle' , self index greaseString
]

{ #category : #accessing }
OOShippingMCQComponent >> toolbarId [
	^ 'ChallengeToolbar' , self index greaseString
]
