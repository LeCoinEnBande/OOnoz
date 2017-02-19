rendering
renderChartOn: html
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