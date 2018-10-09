Class {
	#name : #OOSubThemeListComponent,
	#superclass : #OOComponent,
	#instVars : [
		'theme',
		'owner'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #'instance creation' }
OOSubThemeListComponent class >> theme: aTheme owner: aComponent [
	^ self new
		theme: aTheme;
		owner: aComponent;
		yourself
]

{ #category : #accessing }
OOSubThemeListComponent >> columns [
	^ {('Titre' -> true).
	('Description' -> false).
	('Actions' -> false)}
]

{ #category : #public }
OOSubThemeListComponent >> delete: aSubTheme [
	self flag: #todo. "When we will be able to desable mcq, do it for the one with only one subtheme."
	(OOAbstractMCQ selectMany: [ :m | m subThemes includes: aSubTheme ])
		do: [ :m | 
			m removeSubTheme: aSubTheme.
			m save ].
	aSubTheme theme
		removeSubTheme: aSubTheme;
		save
]

{ #category : #accessing }
OOSubThemeListComponent >> owner [
	^ owner
]

{ #category : #accessing }
OOSubThemeListComponent >> owner: anObject [
	owner := anObject
]

{ #category : #rendering }
OOSubThemeListComponent >> renderContentOn: html [
	html
		tbsContainer: [ self renderTitleOn: html.
			html
				section: [ | toolbarId |
					self renderToolbarFor: (toolbarId := #toolbarSubTheme) on: html.
					html tbsTable
						class: #'table-no-bordered';
						attributeAt: #'data-toggle' put: 'table';
						attributeAt: #'data-search' put: 'true';
						attributeAt: #'data-pagination' put: 'true';
						attributeAt: 'data-toolbar' put: '#' , toolbarId;
						with: [ html tableHead: [ self renderHeaderOn: html ].
							html
								tableBody: [ self subThemes do: [ :st | html tableRow: [ (self tableEntriesFrom: st On: html) do: [ :content | html tableData: content ] ] ] ] ] ] ]
]

{ #category : #rendering }
OOSubThemeListComponent >> renderHeaderOn: html [
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
OOSubThemeListComponent >> renderTitleOn: html [
	html div
		class: #'text-center';
		with: [ html heading: self title ]
]

{ #category : #rendering }
OOSubThemeListComponent >> renderToolbarFor: anId on: html [
	html section
		id: anId;
		with: [ html tbsAnchor
				bePrimary;
				callback: [ (self owner call: OOSubThemeCreationComponent new)
						ifTrue: [ self owner message: 'Nouveau sous thème créé.' ] ];
				with: 'Ajouter un sous thème' ]
]

{ #category : #accessing }
OOSubThemeListComponent >> subThemes [
	^ self theme subThemes
]

{ #category : #rendering }
OOSubThemeListComponent >> tableEntriesFrom: subTheme On: html [
	^ {subTheme title.
	subTheme description.
	[ html anchor
		callback: [ (self owner call: (OOSubThemeEditionComponent subTheme: subTheme))
				ifTrue: [ self owner message: 'Sous thème modifié.' ] ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Éditer';
				iconEdit ].
	html space.
	html anchor
		callback: [ self delete: subTheme ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Supprimer';
				iconTrash ] ]}
]

{ #category : #accessing }
OOSubThemeListComponent >> theme [
	^ theme
]

{ #category : #accessing }
OOSubThemeListComponent >> theme: anObject [
	theme := anObject
]

{ #category : #accessing }
OOSubThemeListComponent >> title [
	^ 'Sous-thèmes de ' , self theme title
]
