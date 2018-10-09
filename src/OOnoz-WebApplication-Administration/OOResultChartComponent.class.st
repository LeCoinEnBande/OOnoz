Class {
	#name : #OOResultChartComponent,
	#superclass : #OOAbstractStatChartComponent,
	#instVars : [
		'selectedCol',
		'successRate'
	],
	#category : 'OOnoz-WebApplication-Administration-Pages'
}

{ #category : #rendering }
OOResultChartComponent >> chartTitle [
	^ String
		streamContents: [ :s | 
			s
				<< 'Taux de completion et de réussite des QCMs de ';
				<< (self selectedCol ifNil: [ self values key size asString , ' fournisseurs.' ] ifNotNil: #displayName) ]
]

{ #category : #accessing }
OOResultChartComponent >> description [
	^ 'Cet écran vous permettra de visualiser les le taux de completion des QCMs ainsi que les taux de réussite pour chaque fournisseur et pour chacun des QCMs des fournisseurs.'
]

{ #category : #accessing }
OOResultChartComponent >> image [
	^ 'result.jpg'
]

{ #category : #initialization }
OOResultChartComponent >> initialize [
	super initialize.
	self successRate: 10
]

{ #category : #rendering }
OOResultChartComponent >> renderButtonsOn: html [
	self selectedCol
		ifNotNil: [ html tbsAnchor
				beDanger;
				callback: [ self selectedCol: nil ];
				with: [ html span class: 'fa fa-arrow-up'.
					html text: ' Retour aux fournisseurs' ] ]
		ifNil: [ super renderButtonsOn: html ].
	html space
]

{ #category : #rendering }
OOResultChartComponent >> renderChartOn: html [
	| chart |
	chart := ChartJsComponent
		data:
			((Chart2dData xObjects: self values key multiYObjects: self values value)
				multiValueTooltip: (self selectedCol ifNil: [ 'Les QCMs de <key> ont été <label> <value> fois' ] ifNotNil: [ '<key> a été <label> <value> fois.' ]);
				keyDisplayBlock: [ :object | 
					(object isUser
						ifTrue: [ object displayName ]
						ifFalse: [ object title ]) displayContractedTo: 14 ];
				chartType: ChartBar;
				yourself).
	self selectedCol ifNil: [ chart callback: [ :value :key | self selectedCol: key ] ].
	chart data xObjects ifEmpty: [ self renderEmptyScreenOn: html ] ifNotEmpty: [ html render: chart ]
]

{ #category : #rendering }
OOResultChartComponent >> renderHookOn: html [
	html
		form: [ html text: 'Note miniale de réussite '.
			html
				tbsFormGroup: [ html textInput
						tbsFormControl;
						class: #slider;
						callback: [ :rate | self successRate: rate asInteger ];
						onChange:
							(html jQuery ajax
								serializeThis;
								onSuccess:
									((html jQuery: #'chart-stat') load
										html: [ :r | 
											self renderChartOn: r.
											self valuesCache: nil ]));
						attributeAt: 'data-provide' put: 'slider';
						attributeAt: 'data-slider-id' put: html nextId;
						attributeAt: 'data-slider-min' put: '-20';
						attributeAt: 'data-slider-max' put: '20';
						attributeAt: 'data-slider-ticks' put: '[-20,-10,0,10,20]';
						attributeAt: 'data-slider-ticks-labels' put: '["-20","-10","0","10","20"]';
						attributeAt: 'data-slider-step' put: '1';
						attributeAt: 'data-slider-value' put: self successRate asString ] ]
]

{ #category : #initialization }
OOResultChartComponent >> resetFilters [
	super resetFilters.
	self successRate: 10
]

{ #category : #accessing }
OOResultChartComponent >> selectedCol [
	^ selectedCol
]

{ #category : #accessing }
OOResultChartComponent >> selectedCol: anObject [
	selectedCol := anObject
]

{ #category : #accessing }
OOResultChartComponent >> successRate [
	^ successRate
]

{ #category : #accessing }
OOResultChartComponent >> successRate: anObject [
	successRate := anObject
]

{ #category : #accessing }
OOResultChartComponent >> title [
	^ 'Résultats moyens des QCMs'
]

{ #category : #rendering }
OOResultChartComponent >> values [
	^ valuesCache
		ifNil: [ valuesCache := self selectedCol
				ifNil: [ | users datas |
					users := OOUser selectAll asArray
						sortByDisplayName;
						select: [ :user | self mcqInput anySatisfy: [ :mcq | user mcqs includes: mcq ] ].
					datas := users
						collect: [ :user | 
							| mcqs |
							mcqs := self mcqInput intersection: user mcqs.
							Array
								with: (OOMCQResult count: [ :res | mcqs includes: res mcq ])
								with: (OOMCQResult count: [ :res | (mcqs includes: res mcq) and: [ res isFinished ] ])
								with: (OOMCQResult count: [ :res | (mcqs includes: res mcq) and: [ res isFinished and: [ res result >= self successRate ] ] ]) ].
					users -> (Array with: 'joués' -> (datas collect: #first) with: 'complétés' -> (datas collect: #second) with: 'réussis' -> (datas collect: #third)) ]
				ifNotNil: [ :user | 
					| mcqs datas |
					mcqs := user mcqs asArray
						sortByTitle;
						select: [ :m | self mcqInput anySatisfy: [ :mcq | mcq = m ] ].
					datas := mcqs
						collect: [ :m | 
							Array
								with: (OOMCQResult count: [ :res | m = res mcq ])
								with: (OOMCQResult count: [ :res | m = res mcq and: [ res isFinished ] ])
								with: (OOMCQResult count: [ :res | m = res mcq and: [ res isFinished and: [ res result >= self successRate ] ] ]) ].
					mcqs -> (Array with: 'joués' -> (datas collect: #first) with: 'complétés' -> (datas collect: #second) with: 'réussis' -> (datas collect: #third)) ] ]
]
