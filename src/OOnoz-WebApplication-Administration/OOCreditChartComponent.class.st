Class {
	#name : #OOCreditChartComponent,
	#superclass : #OOAbstractStatChartComponent,
	#instVars : [
		'mode',
		'selectedTheme'
	],
	#category : 'OOnoz-WebApplication-Administration-Pages'
}

{ #category : #rendering }
OOCreditChartComponent >> chartTitle [
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

{ #category : #rendering }
OOCreditChartComponent >> chartTitleFrom: datas [
	^ String
		streamContents: [ :s | 
			s
				<< 'Crédits dépensés parmis ';
				<< datas size;
				space;
				<<
					((self mode = #thèmes and: [ self selectedTheme isNotNil ])
						ifTrue: [ 'sous-thèmes de ' , self selectedTheme title ]
						ifFalse: [ self mode ]) ]
]

{ #category : #accessing }
OOCreditChartComponent >> description [
	^ 'Cet écran vous permettra de visualiser les crédits dépensés parmis les différents thèmes, sous thèmes et fournisseurs.'
]

{ #category : #accessing }
OOCreditChartComponent >> image [
	^ 'money.jpg'
]

{ #category : #initialization }
OOCreditChartComponent >> initialize [
	super initialize.
	self mode: #thèmes
]

{ #category : #accessing }
OOCreditChartComponent >> mode [
	^ mode
]

{ #category : #accessing }
OOCreditChartComponent >> mode: anObject [
	mode := anObject
]

{ #category : #rendering }
OOCreditChartComponent >> renderButtonsOn: html [
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
OOCreditChartComponent >> renderChartOn: html [
	| chart |
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
	chart data xObjects ifEmpty: [ self renderEmptyScreenOn: html ] ifNotEmpty: [ html render: chart ]
]

{ #category : #accessing }
OOCreditChartComponent >> selectedTheme [
	^ selectedTheme
]

{ #category : #accessing }
OOCreditChartComponent >> selectedTheme: anObject [
	selectedTheme := anObject
]

{ #category : #accessing }
OOCreditChartComponent >> title [
	^ 'Crédits dépensés'
]

{ #category : #rendering }
OOCreditChartComponent >> values [
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
