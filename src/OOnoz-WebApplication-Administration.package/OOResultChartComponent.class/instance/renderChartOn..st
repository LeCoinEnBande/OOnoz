rendering
renderChartOn: html
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