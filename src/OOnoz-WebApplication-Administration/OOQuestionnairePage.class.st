Class {
	#name : #OOQuestionnairePage,
	#superclass : #OOPage,
	#instVars : [
		'message'
	],
	#category : 'OOnoz-WebApplication-Administration-Pages'
}

{ #category : #accessing }
OOQuestionnairePage >> breadcrumpLabel [
	^ #Questionnaires
]

{ #category : #accessing }
OOQuestionnairePage >> columns [
	^ #('Nom' 'Communauté' 'Type' 'Prix' 'Difficulté' 'Complété' 'Note' 'Actif' 'Modifier')
]

{ #category : #rendering }
OOQuestionnairePage >> delete: aMCQ [
	self currentUser removeMCQAndSave: aMCQ
]

{ #category : #accessing }
OOQuestionnairePage >> description [
	^ 'Vous trouverez sur cette page les informations relatives à vos questionnaires.'
]

{ #category : #accessing }
OOQuestionnairePage >> message [
	^ message
]

{ #category : #accessing }
OOQuestionnairePage >> message: anObject [
	message := anObject
]

{ #category : #accessing }
OOQuestionnairePage >> moduleName [
	^ #mcq
]

{ #category : #rendering }
OOQuestionnairePage >> renderComponentOn: html [
	html
		tbsContainer: [ self renderMessageOn: html.
			html
				section: [ | toolbarId |
					self renderToolbarFor: (toolbarId := #toolbar) on: html.
					html tbsTable
						class: #'table-no-bordered';
						attributeAt: #'data-sort-name' put: 'true';
						attributeAt: #'data-toggle' put: 'table';
						attributeAt: #'data-search' put: 'true';
						attributeAt: #'data-pagination' put: 'true';
						attributeAt: 'data-toolbar' put: '#' , toolbarId;
						with: [ html tableHead: [ self renderHeaderOn: html ].
							html
								tableBody:
									[ self currentUser editableMcqs do: [ :mcq | html tableRow: [ (self tableEntriesFrom: mcq On: html) do: [ :content | html tableData: content ] ] ] ] ] ] ].
	html document addLoadScript: '$(".material-switch").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)});' js
]

{ #category : #rendering }
OOQuestionnairePage >> renderHeaderOn: html [
	html tableRow: [ self columns do: [ :title | html tableHeading: title ] ]
]

{ #category : #rendering }
OOQuestionnairePage >> renderMessageOn: html [
	self message ifNil: [ ^ self ].
	html tbsAlert
		beInfo;
		beDismissible;
		role: #alert;
		with: [ html tbsDismissAlertButton.
			html strong: self message ].
	self message: nil
]

{ #category : #rendering }
OOQuestionnairePage >> renderToolbarFor: anId on: html [
	html section
		id: anId;
		with: [ html tbsAnchor
				bePrimary;
				callback: [ (self call: OOMCQCreationComponent new)
						ifTrue: [ self
								message:
									(self currentUser isAdmin
										ifTrue: [ 'Nouveau QCM créé.' ]
										ifFalse: [ 'Votre QCM à été soumis à validation d''un administrateur.' ]) ] ];
				with: 'Ajouter'.
			self currentUser can validateMCQs
				ifTrue: [ html space.
					html tbsAnchor
						beDefault;
						callback: [ self call: OOValidationPage new ];
						with: [ html text: 'Validations  '.
							html tbsBadge: (OOAbstractMCQ count: [ :m | m state = #undefined ]) ] ] ]
]

{ #category : #rendering }
OOQuestionnairePage >> tableEntriesFrom: mcq On: html [
	^ {mcq title.
	[ mcq renderThemeAndSubThemesOn: html ].
	mcq class kind.
	[ html tbsLabel
		beInfoIf: mcq price > 0;
		beDefaultIf: mcq price = 0;
		with: mcq printPrice ].
	[ html tbsLabel
		beDefault;
		class: 'label-difficulty-' , mcq level asString;
		with: mcq level asString ].
	[ | times |
	times := (OOMCQResult selectMany: [ :result | result mcq = mcq and: [ result isFinished ] ]) size.
	html tbsLabel
		beInfoIf: times > 0;
		beDangerIf: times = 0;
		with: times asString , ' fois' ].
	(OOMCQRate displayRateOf: mcq).
	[ html form
		class: 'material-switch';
		with: [ html checkbox
				id: html nextId;
				disabled: (self currentUser isAdmin not and: [ mcq state = #undefined ]);
				onTrue: [ mcq
						state: #active;
						save ]
					onFalse: [ mcq
							state: #inactive;
							save ];
				onChange: html jQuery ajax serializeThisCheckbox;
				value: mcq isActivated.
			html label
				for: html lastId;
				tbsTooltip: 'En attente de validation' if: (self currentUser isAdmin not and: [ mcq state = #undefined ]);
				class: 'label-primary' ] ].
	[ html anchor
		callback: [ (self call: (OOMCQEditionComponent mcq: mcq))
				ifTrue: [ self message: 'QCM édité.' ] ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Éditer';
				iconEdit ] ]}
]

{ #category : #accessing }
OOQuestionnairePage >> title [
	^ 'Gérer les questionnaires existants'
]
