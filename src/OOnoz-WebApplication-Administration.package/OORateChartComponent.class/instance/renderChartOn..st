rendering
renderChartOn: html
	| chart values |
	values := self values.
	chart := ChartJsComponent
		data:
			((Chart2dData xObjects: values key function: values value)
				title: [ :datas :xObjects | self chartTitleFrom: xObjects ];
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