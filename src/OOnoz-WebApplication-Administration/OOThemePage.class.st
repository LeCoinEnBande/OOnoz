Class {
	#name : #OOThemePage,
	#superclass : #OOPage,
	#instVars : [
		'message',
		'subThemesComponent'
	],
	#category : 'OOnoz-WebApplication-Administration-Pages'
}

{ #category : #accessing }
OOThemePage >> breadcrumpLabel [
	^ #Communautés
]

{ #category : #hooks }
OOThemePage >> children [
	^ Array with: self subThemesComponent
]

{ #category : #accessing }
OOThemePage >> columns [
	^ {('Titre' -> true).
	('Description' -> false).
	('Sous-Thèmes' -> true).
	('Actions' -> false)}
]

{ #category : #public }
OOThemePage >> delete: aTheme [
	self flag: #todo.	"When we will be able to desable mcq, do it."
	(OOAbstractMCQ selectMany: [ :m | m theme = aTheme ])
		do: [ :m | 
			m resetSubThemes.
			m save ].
	aTheme remove
]

{ #category : #accessing }
OOThemePage >> message [
	^ message
]

{ #category : #accessing }
OOThemePage >> message: anObject [
	message := anObject
]

{ #category : #accessing }
OOThemePage >> moduleName [
	^ #theme
]

{ #category : #rendering }
OOThemePage >> renderComponentOn: html [
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
								tableBody:
									[ self themes do: [ :theme | html tableRow: [ (self tableEntriesFrom: theme On: html) do: [ :content | html tableData: content ] ] ] ] ] ] ].
	html tbsContainer
		id: #'list-subthemes';
		with: [ self subThemesComponent ifNotNil: [ :c | html render: c ] ]
]

{ #category : #rendering }
OOThemePage >> renderHeaderOn: html [
	html
		tableRow: [ self columns
				do: [ :asso | 
					| th |
					th := html tableHeading.
					asso value
						ifTrue: [ th attributeAt: 'data-sortable' put: true ].
					th with: asso key ] ]
]

{ #category : #rendering }
OOThemePage >> renderMessageOn: html [
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
OOThemePage >> renderToolbarFor: anId on: html [
	html section
		id: anId;
		with: [ html tbsAnchor
				bePrimary;
				callback: [ (self call: OOThemeCreationComponent new)
						ifTrue: [ self message: 'Nouveau thème créé.' ] ];
				with: 'Ajouter un thème' ]
]

{ #category : #accessing }
OOThemePage >> subThemesComponent [
	^ subThemesComponent
]

{ #category : #accessing }
OOThemePage >> subThemesComponent: anObject [
	subThemesComponent := anObject
]

{ #category : #rendering }
OOThemePage >> tableEntriesFrom: theme On: html [
	^ {theme title.
	theme description.
	[ theme subThemes
		do: [ :st | 
			html tbsLabel
				beDefault;
				with: st title.
			html space ] ].
	[ html anchor
		callback: [ (self call: (OOThemeEditionComponent theme: theme))
				ifTrue: [ self message: 'Thème modifié.' ] ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Éditer';
				iconEdit ].
	html space.
	html anchor
		callback: [ self delete: theme ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Supprimer';
				iconTrash ].
	html space.
	html tbsGlyphIcon
		class: #clickable;
		style: 'color: #1abc9c;';
		onClick:
			((html jQuery id: #'list-subthemes') load
				html: [ :r | 
					self subThemesComponent: (OOSubThemeListComponent theme: theme owner: self).
					r render: self subThemesComponent ];
				onComplete: '$("table").bootstrapTable();$("html, body").scrollTop($("#list-subthemes").offset().top);' js);
		tbsTooltip: 'Afficher les sous thèmes';
		iconList ]}
]

{ #category : #accessing }
OOThemePage >> themes [
	^ OOTheme selectAll
]

{ #category : #accessing }
OOThemePage >> title [
	^ ''
]
