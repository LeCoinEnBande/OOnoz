Class {
	#name : #OORepartitionChartComponent,
	#superclass : #OOAbstractStatChartComponent,
	#instVars : [
		'mode',
		'selectedTheme'
	],
	#category : 'OOnoz-WebApplication-Administration-Pages'
}

{ #category : #rendering }
OORepartitionChartComponent >> chartTitle [
	^ String
		streamContents: [ :s | 
			s
				<< 'Répartition des QCMs parmis ';
				<< self values size;
				space;
				<<
					((self mode = #thèmes and: [ self selectedTheme isNotNil ])
						ifTrue: [ 'sous-thèmes de ' , self selectedTheme title ]
						ifFalse: [ self mode ]) ]
]

{ #category : #accessing }
OORepartitionChartComponent >> description [
	^ 'Cet écran vous permettra de visualiser la répartition des QCMs parmis les différents thèmes, sous thèmes et fournisseurs.'
]

{ #category : #accessing }
OORepartitionChartComponent >> image [
	^ 'chart1.png'
]

{ #category : #initialization }
OORepartitionChartComponent >> initialize [
	super initialize.
	self mode: #thèmes
]

{ #category : #accessing }
OORepartitionChartComponent >> mode [
	^ mode
]

{ #category : #accessing }
OORepartitionChartComponent >> mode: anObject [
	mode := anObject
]

{ #category : #rendering }
OORepartitionChartComponent >> renderButtonsOn: html [
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
OORepartitionChartComponent >> renderChartOn: html [
	| chart |
	chart := ChartJsComponent
		data:
			((Chart1dData values: self values)
				singleValueTooltip: '<key> possède <value> qcm(s)';
				chartType: ChartDonut;
				yourself).
	(self mode = #thèmes and: [ self selectedTheme isNil ])
		ifTrue: [ chart callback: [ :value :key | self selectedTheme: (OOTheme selectOne: [ :theme | theme title = key ]) ] ].
	chart data datas ifEmpty: [ self renderEmptyScreenOn: html ] ifNotEmpty: [ html render: chart ]
]

{ #category : #accessing }
OORepartitionChartComponent >> selectedTheme [
	^ selectedTheme
]

{ #category : #accessing }
OORepartitionChartComponent >> selectedTheme: anObject [
	selectedTheme := anObject
]

{ #category : #accessing }
OORepartitionChartComponent >> title [
	^ 'Répartition des QCMs'
]

{ #category : #rendering }
OORepartitionChartComponent >> values [
	^ valuesCache
		ifNil: [ valuesCache := self mode = #thèmes
				ifTrue: [ (self selectedTheme
						ifNil: [ OOTheme selectAll asArray
								sortByTitle;
								collect: [ :theme | theme title -> (self mcqInput select: [ :mcq | mcq theme = theme ]) size ] thenReject: [ :asso | asso value = 0 ] ]
						ifNotNil: [ :theme | 
							theme subThemes asArray
								sortByTitle;
								collect: [ :subT | subT title -> (self mcqInput select: [ :mcq | mcq subThemes includes: subT ]) size ] thenReject: [ :asso | asso value = 0 ] ]) asArray ]
				ifFalse: [ OOUser selectAll asArray
						sort: [ :a :b | a displayName < b displayName ];
						collect: [ :user | user displayName -> (self mcqInput intersection: user mcqs) size ] thenReject: [ :asso | asso value = 0 ] ] ]
]
