rendering
renderChartOn: html
	| chartData |
	chartData := Chart1dData values: self values.
	chartData title: [ :datas | self chartTitleFrom: datas ].
	chartData singleValueTooltip: '<key> possède <value> qcms'.
	chartData chartType: ChartDonut.
	html
		render:
			(ChartJsComponent
				data: chartData
				callback: [ :value :key | 
					(self mode = #thèmes and: [ self selectedTheme isNil ])
						ifTrue: [ self selectedTheme: (OOTheme selectOne: [ :theme | theme title = key ]) ] ])