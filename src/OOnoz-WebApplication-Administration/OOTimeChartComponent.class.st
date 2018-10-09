Class {
	#name : #OOTimeChartComponent,
	#superclass : #OOAbstractStatChartComponent,
	#instVars : [
		'mode',
		'selectedTheme'
	],
	#category : 'OOnoz-WebApplication-Administration-Pages'
}

{ #category : #rendering }
OOTimeChartComponent >> chartTitle [
	^ String
		streamContents: [ :s | 
			s
				<< 'Crédits dépensés parmis ';
				<< self values key size;
				space;
				<<
					((self mode = #thèmes and: [ self selectedTheme isNotNil ])
						ifTrue: [ 'sous-thèmes de ' , self selectedTheme title ]
						ifFalse: [ self mode ]) ]
]

{ #category : #accessing }
OOTimeChartComponent >> description [
	^ 'Cet écran vous permettra de visualiser le taux de jeu de soumission de QCMs au cours du temps.'
]

{ #category : #accessing }
OOTimeChartComponent >> image [
	^ 'time.jpg'
]

{ #category : #initialization }
OOTimeChartComponent >> initialize [
	super initialize.
	self mode: #thèmes
]

{ #category : #accessing }
OOTimeChartComponent >> mode [
	^ mode
]

{ #category : #accessing }
OOTimeChartComponent >> mode: anObject [
	mode := anObject
]

{ #category : #rendering }
OOTimeChartComponent >> renderButtonsOn: html [
	| modeNot |
	self selectedTheme
		ifNotNil: [ html tbsAnchor
				beDanger;
				callback: [ self selectedTheme: nil ];
				with: [ html span class: 'fa fa-arrow-up'.
					html text: ' Retour aux thèmes' ] ]
		ifNil: [ super renderButtonsOn: html ].
	html space.
	modeNot := self mode = #thèmes
		ifTrue: [ #fournisseurs ]
		ifFalse: [ #thèmes ].
	html tbsAnchor
		bePrimary;
		callback: [ self mode: modeNot.
			self selectedTheme: nil ];
		with: [ html span class: 'fa fa-repeat '.
			html text: ' Répartition par ' , modeNot ]
]

{ #category : #rendering }
OOTimeChartComponent >> renderChartOn: html [
	"| chart |
	chart := ChartJsComponent
		data:
			((Chart2dData xObjects: self values key function: self values value)
				singleValueTooltip: '<key> à rapporté <value> crédits';
				keyDisplayBlock: [ :object | 
					object isUser
						ifTrue: [ object displayName ]
						ifFalse: [ object title ] ];
				chartType: ChartRadar;
				yourself).
	(self mode = #thèmes and: [ self selectedTheme isNil ])
		ifTrue: [ chart callback: [ :value :key | self selectedTheme: key ] ].
	chart data xObjects ifEmpty: [ self renderEmptyScreenOn: html ] ifNotEmpty: [ html render: chart ]" self flag: #todo
]

{ #category : #accessing }
OOTimeChartComponent >> selectedTheme [
	^ selectedTheme
]

{ #category : #accessing }
OOTimeChartComponent >> selectedTheme: anObject [
	selectedTheme := anObject
]

{ #category : #accessing }
OOTimeChartComponent >> title [
	^ 'Crédits dépensés'
]

{ #category : #rendering }
OOTimeChartComponent >> values [
	^ valuesCache
		ifNil: [ valuesCache := self mode = #thèmes
				ifTrue: [ self selectedTheme
						ifNil: [ (OOTheme selectAll asArray
								sortByTitle;
								select: [ :theme | self mcqInput anySatisfy: [ :mcq | mcq theme = theme ] ]) -> [ :t | (self mcqInput select: [ :mcq | mcq theme = t ]) sum: #price ] ]
						ifNotNil: [ :theme | 
							(theme subThemes asArray
								sortByTitle;
								select: [ :st | self mcqInput anySatisfy: [ :mcq | mcq subThemes includes: st ] ]) -> [ :st | (self mcqInput select: [ :mcq | mcq subThemes includes: st ]) sum: #price ] ] ]
				ifFalse: [ (OOUser selectAll asArray
						sort: [ :a :b | a displayName < b displayName ];
						reject: [ :user | (self mcqInput intersection: user mcqs) isEmpty ]) -> [ :user | (self mcqInput intersection: user mcqs) sum: #price ] ] ]
]
