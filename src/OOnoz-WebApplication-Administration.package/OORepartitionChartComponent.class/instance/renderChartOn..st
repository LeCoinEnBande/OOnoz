rendering
renderChartOn: html
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