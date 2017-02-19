rendering
renderChartOn: html
	| chart values |
	values := self values.
	chart := ChartJsComponent
		data:
			((Chart2dData xObjects: values key multiYObjects: values value)
				title: [ :datas | self chartTitleFrom: datas ];
				multiValueTooltip: (self selectedCol ifNil: [ 'Les QCMs de <key> ont été <label> <value> fois' ] ifNotNil: [ '<key> a été <label> <value> fois.' ]);
				keyDisplayBlock: [ :object | 
					(object isUser
						ifTrue: [ object displayName ]
						ifFalse: [ object title ]) displayContractedTo: 14 ];
				chartType: ChartBar;
				yourself).
	self selectedCol ifNil: [ chart callback: [ :value :key | self selectedCol: key ] ].
	chart data xObjects ifEmpty: [ self renderEmptyScreenOn: html ] ifNotEmpty: [ html render: chart ]