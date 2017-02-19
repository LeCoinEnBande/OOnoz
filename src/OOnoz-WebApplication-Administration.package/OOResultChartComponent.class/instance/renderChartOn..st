rendering
renderChartOn: html
	| chart values |
	values := self values.
	chart := ChartJsComponent
		data:
			((Chart2dData xObjects: values key multiYObjects: values value)
				title: [ :datas | self chartTitleFrom: datas ];
				multiValueTooltip: 'Les questionnaires de <key> ont été <label> <value> fois';
				keyDisplayBlock: [ :object | 
					object isUser
						ifTrue: [ object displayName ]
						ifFalse: [ object title ] ];
				chartType: ChartBar;
				yourself).
	self selectedCol ifNil: [ chart callback: [ :value :key | self selectedCol: key ] ].
	chart data xObjects ifEmpty: [ self renderEmptyScreenOn: html ] ifNotEmpty: [ html render: chart ]