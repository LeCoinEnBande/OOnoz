Class {
	#name : #OOSubThemeComponent,
	#superclass : #OOComponent,
	#instVars : [
		'subTheme',
		'shouldDisplayThemeSelection',
		'index'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #'instance creation' }
OOSubThemeComponent class >> subTheme: aBlock [
	^ self new
		subTheme: aBlock;
		yourself
]

{ #category : #accessing }
OOSubThemeComponent >> imageId [
	^ 'imageSubtheme' , self index greaseString
]

{ #category : #accessing }
OOSubThemeComponent >> index [
	^ index ifNil: [ 1 ]
]

{ #category : #accessing }
OOSubThemeComponent >> index: anObject [
	index := anObject
]

{ #category : #initialization }
OOSubThemeComponent >> initialize [
	super initialize.
	self shouldDisplayThemeSelection: true
]

{ #category : #accessing }
OOSubThemeComponent >> noThemeSelection [
	self shouldDisplayThemeSelection: false
]

{ #category : #rendering }
OOSubThemeComponent >> renderContentOn: html [
	html
		tbsRow: [ html
				tbsColumn: [ self renderGlobalConfigurationOn: html.
					self renderOtherOptionsOn: html ]
				mediumSize: 8.
			html
				tbsColumn: [ html
						header: [ html heading
								level3;
								with: 'Image d''illustration' ].
					html section
						id: self imageId;
						with: [ self renderImageOn: html ] ]
				mediumSize: 4 ]
]

{ #category : #rendering }
OOSubThemeComponent >> renderGlobalConfigurationOn: html [
	html
		header: [ html heading
				level3;
				with: 'Configuration globale' ].
	html
		section: [ html
				tbsFormGroup: [ | label |
					label := 'Titre du sous thème'.
					html label
						for: html nextId;
						tbsScreenReaderOnly;
						with: label.
					html textInput
						tbsFormControl;
						required;
						id: html lastId;
						placeholder: label;
						callback: [ :title | self subTheme title: title ];
						onChange: html jQuery ajax serializeThis;
						value: self subTheme title ].
			self renderThemeSelectionOn: html.
			html
				tbsFormGroup: [ | label |
					label := 'Description du sous thème'.
					html label
						for: html nextId;
						tbsScreenReaderOnly;
						with: label.
					html textArea
						tbsFormControl;
						id: html lastId;
						placeholder: label;
						callback: [ :description | self subTheme description: description ];
						value: self subTheme description;
						onChange: html jQuery ajax serializeThis;
						rows: 1 ] ]
]

{ #category : #rendering }
OOSubThemeComponent >> renderImageOn: html [
	html image
		class: 'img-responsive';
		url:
			(self subTheme mediaLink isEmptyOrNil
				ifTrue: [ self subTheme class defaultMediaLink ]
				ifFalse: [ self subTheme mediaLink ])
]

{ #category : #rendering }
OOSubThemeComponent >> renderOtherOptionsOn: html [
	html
		section: [ html heading
				level3;
				with: 'Autres options'.
			html
				tbsFormGroup: [ | label |
					label := 'URL d''une image d''illustration'.
					html label
						for: html nextId;
						tbsScreenReaderOnly;
						with: label.
					html textInput
						tbsFormControl;
						id: html lastId;
						placeholder: label;
						callback: [ :url | self subTheme mediaLink: url ];
						value: self subTheme mediaLink;
						onChange:
							(html jQuery ajax
								serializeThis;
								onComplete: ((html jQuery id: self imageId) load html: [ :r | self renderImageOn: r ])) ] ]
]

{ #category : #rendering }
OOSubThemeComponent >> renderThemeSelectionOn: html [
	self shouldDisplayThemeSelection
		ifFalse: [ ^ self ].
	html
		tbsFormGroup: [ html select
				title: 'Thème parent';
				required;
				class: #selectpicker;
				attributeAt: 'data-width' put: '100%';
				list: OOTheme selectAll;
				labels: [ :theme | theme title ];
				callback: [ :theme | self subTheme theme: theme ];
				selected: self subTheme theme ]
]

{ #category : #accessing }
OOSubThemeComponent >> shouldDisplayThemeSelection [
	^ shouldDisplayThemeSelection
]

{ #category : #accessing }
OOSubThemeComponent >> shouldDisplayThemeSelection: anObject [
	shouldDisplayThemeSelection := anObject
]

{ #category : #accessing }
OOSubThemeComponent >> subTheme [
	^ subTheme value
]

{ #category : #accessing }
OOSubThemeComponent >> subTheme: anObject [
	subTheme := anObject
]
