Class {
	#name : #OORateChartComponent,
	#superclass : #OOAbstractStatChartComponent,
	#instVars : [
		'mode',
		'selectedTheme'
	],
	#category : 'OOnoz-WebApplication-Administration-Pages'
}

{ #category : #rendering }
OORateChartComponent >> chartTitle [
	^ String
		streamContents: [ :s | 
			s
				<< 'Notes des QCMs parmis les ';
				<< self values key size;
				space;
				<<
					((self mode = #thèmes and: [ self selectedTheme isNotNil ])
						ifTrue: [ 'sous-thèmes de ' , self selectedTheme title ]
						ifFalse: [ self mode ]) ]
]

{ #category : #accessing }
OORateChartComponent >> description [
	^ 'Cet écran vous permettra de visualiser les notes moyennes des QCMs des founisseurs, des thèmes ou encore des sous-thèmes d''un thème.'
]

{ #category : #accessing }
OORateChartComponent >> image [
	^ 'grades.jpg'
]

{ #category : #initialization }
OORateChartComponent >> initialize [
	super initialize.
	self mode: #thèmes
]

{ #category : #accessing }
OORateChartComponent >> mode [
	^ mode
]

{ #category : #accessing }
OORateChartComponent >> mode: anObject [
	mode := anObject
]

{ #category : #rendering }
OORateChartComponent >> renderButtonsOn: html [
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
OORateChartComponent >> renderChartOn: html [
	| chart |
	chart := ChartJsComponent
		data:
			((Chart2dData xObjects: self values key function: self values value)
				singleValueTooltip: '<key> à une note moyenne de <value>';
				keyDisplayBlock: [ :object | 
					object isUser
						ifTrue: [ object displayName ]
						ifFalse: [ object title ] ];
				chartType: ChartBar;
				yourself).
	(self mode = #thèmes and: [ self selectedTheme isNil ])
		ifTrue: [ chart callback: [ :value :key | self selectedTheme: key ] ].
	chart data xObjects ifEmpty: [ self renderEmptyScreenOn: html ] ifNotEmpty: [ html render: chart ]
]

{ #category : #accessing }
OORateChartComponent >> selectedTheme [
	^ selectedTheme
]

{ #category : #accessing }
OORateChartComponent >> selectedTheme: anObject [
	selectedTheme := anObject
]

{ #category : #accessing }
OORateChartComponent >> title [
	^ 'Note moyenne des QCMs'
]

{ #category : #rendering }
OORateChartComponent >> values [
	^ valuesCache
		ifNil: [ valuesCache := self mode = #thèmes
				ifTrue: [ self selectedTheme
						ifNil: [ (OOTheme selectAll asArray
								sortByTitle;
								select: [ :theme | self mcqInput anySatisfy: [ :mcq | mcq theme = theme ] ]) -> [ :t | (self mcqInput select: [ :mcq | mcq theme = t ]) average: #averageRate ] ]
						ifNotNil: [ :theme | 
							(theme subThemes asArray
								sortByTitle;
								select: [ :st | self mcqInput anySatisfy: [ :mcq | mcq subThemes includes: st ] ]) -> [ :st | (self mcqInput select: [ :mcq | mcq subThemes includes: st ]) average: #averageRate ] ] ]
				ifFalse: [ (OOUser selectAll asArray
						sort: [ :a :b | a displayName < b displayName ];
						reject: [ :user | (self mcqInput intersection: user mcqs) isEmpty ]) -> [ :user | (self mcqInput intersection: user mcqs) average: #averageRate ] ] ]
]
