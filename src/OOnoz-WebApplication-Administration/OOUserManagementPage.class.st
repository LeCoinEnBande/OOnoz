Class {
	#name : #OOUserManagementPage,
	#superclass : #OOPage,
	#instVars : [
		'message'
	],
	#category : 'OOnoz-WebApplication-Administration-Pages'
}

{ #category : #accessing }
OOUserManagementPage >> breadcrumpLabel [
	^ #Utilisateurs
]

{ #category : #accessing }
OOUserManagementPage >> columns [
	^ {('Nom' -> true).
	('Role' -> true).
	('Adresse' -> false).
	('Ville' -> true).
	('Région' -> true).
	('Pays' -> true).
	('Email' -> false).
	('Actif' -> false).
	('Modifier' -> false)}
]

{ #category : #accessing }
OOUserManagementPage >> message [
	^ message
]

{ #category : #accessing }
OOUserManagementPage >> message: anObject [
	message := anObject
]

{ #category : #accessing }
OOUserManagementPage >> moduleName [
	^ #users
]

{ #category : #rendering }
OOUserManagementPage >> renderComponentOn: html [
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
								tableBody: [ OOUser selectAll
										do: [ :theme | html tableRow: [ (self tableEntriesFrom: theme On: html) do: [ :content | html tableData: content ] ] ] ] ] ] ].
	html document
		addLoadScript:
			'$(".material-switch").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)});
			$("table").on("all.bs.table", function (){ $(".material-switch").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)}); });'
				js
]

{ #category : #rendering }
OOUserManagementPage >> renderHeaderOn: html [
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
OOUserManagementPage >> renderMessageOn: html [
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
OOUserManagementPage >> renderToolbarFor: anId on: html [
	html section
		id: anId;
		with: [ html tbsAnchor
				bePrimary;
				callback: [ (self call: OOAddUserComponent new)
						ifTrue: [ self message: 'L''utilisateur a bien été créé.' ] ];
				with: 'Ajouter' ]
]

{ #category : #rendering }
OOUserManagementPage >> tableEntriesFrom: anUser On: html [
	^ {anUser displayName.
	anUser role displayName.
	anUser address.
	anUser city.
	anUser state.
	anUser country.
	anUser mail.
	[ html form
		class: 'material-switch pull-right';
		with: [ html checkbox
				id: html nextId;
				callback: [ :bool | 
					anUser
						isActivated: bool;
						save ];
				onChange: html jQuery ajax serializeThisCheckbox;
				value: anUser isActivated.
			html label
				for: html lastId;
				class: 'label-primary' ] ].
	[ html anchor
		callback: [ (self call: (OOEditUserComponent user: anUser))
				ifTrue: [ self message: 'Utilisateur édité.' ] ];
		with: [ html tbsGlyphIcon
				tbsTooltip: 'Éditer';
				iconEdit ] ]}
]

{ #category : #accessing }
OOUserManagementPage >> title [
	^ ''
]
