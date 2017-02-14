rendering
renderContentOn: html
	| chartData |
	chartData := Chart1dData values: (OOTheme selectAll collect: [ :theme | theme title -> (1 to: 30) atRandom	"(OOAbstractMCQ count: [ :mcq | mcq theme = theme ])" ]).
	chartData title: [ :datas | 'Répartition des QCMs parmis les ' , datas size asString , ' thèmes.' ].
	chartData singleValueTooltip: '<key> possède <value> qcms'.
	chartData chartType: ChartDonut.
	html render: (ChartJsComponent data: chartData callback: [ :value | 1 halt ])