Class {
	#name : #OOValidationPage,
	#superclass : #OOPage,
	#instVars : [
		'message'
	],
	#category : 'OOnoz-WebApplication-Administration-Pages'
}

{ #category : #accessing }
OOValidationPage >> breadcrumpLabel [
	^ #Questionnaires
]

{ #category : #hooks }
OOValidationPage >> breadcrumpSubLabel [
	^ #Validation
]

{ #category : #accessing }
OOValidationPage >> columns [
	^ #('Nom' 'Communauté' 'Type' 'Prix' 'Difficulté' 'Éditer' 'Valider')
]

{ #category : #rendering }
OOValidationPage >> delete: aMCQ [
	self currentUser removeMCQAndSave: aMCQ
]

{ #category : #accessing }
OOValidationPage >> description [
	^ 'Vous trouverez sur cette page les questionnaires en attente de validation.'
]

{ #category : #accessing }
OOValidationPage >> message [
	^ message
]

{ #category : #accessing }
OOValidationPage >> message: anObject [
	message := anObject
]

{ #category : #actions }
OOValidationPage >> modalId [
	^ #closeModal
]

{ #category : #accessing }
OOValidationPage >> moduleName [
	^ #mcq
]

{ #category : #rendering }
OOValidationPage >> renderComponentOn: html [
	html
		tbsContainer: [ self renderMessageOn: html.
			html
				section: [ | toolbarId |
					self renderToolbarFor: (toolbarId := #toolbar) on: html.
					html tbsTable
						class: #'table-no-bordered';
						attributeAt: #'data-toggle' put: 'table';
						attributeAt: #'data-search' put: 'true';
						attributeAt: #'data-pagination' put: 'true';
						attributeAt: 'data-toolbar' put: '#' , toolbarId;
						with: [ html tableHead: [ self renderHeaderOn: html ].
							html
								tableBody: [ (OOAbstractMCQ selectMany: [ :m | m state = #undefined ]) do: [ :mcq | html tableRow: [ (self tableEntriesFrom: mcq On: html) do: [ :content | html tableData: content ] ] ] ] ] ] ]
]

{ #category : #rendering }
OOValidationPage >> renderHeaderOn: html [
	html tableRow: [ self columns do: [ :title | html tableHeading: title ] ]
]

{ #category : #rendering }
OOValidationPage >> renderMessageOn: html [
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
OOValidationPage >> renderToolbarFor: anId on: html [
	html section
		id: anId;
		with: [ html tbsAnchor
				beDanger;
				callback: [ self answer ];
				with: 'Retour en arrière' ]
]

{ #category : #rendering }
OOValidationPage >> tableEntriesFrom: mcq On: html [
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
	[ html anchor
		callback: [ (self call: (OOMCQEditionComponent mcq: mcq))
				ifTrue: [ self message: 'QCM édité.' ] ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Éditer';
				iconEdit ] ].
	[ html anchor
		callback: [ mcq
				state: #active;
				save ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Activer';
				iconOk ].
	html space.
	html anchor
		style: 'color: red; margin-left: 10px;';
		callback: [ mcq
				state: #inactive;
				save ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Désactiver';
				iconRemove ] ]}
]

{ #category : #accessing }
OOValidationPage >> title [
	^ 'Gérer les questionnaires existants'
]
