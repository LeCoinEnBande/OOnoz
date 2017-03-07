updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: self configuration resourcesURL , '/Dependencies/ChartJsLibrary/ChartJs.css'.
	anHtmlRoot script url: self configuration resourcesURL , '/Dependencies/ChartJsLibrary/BarPlotChart.js'.
	anHtmlRoot script url: self configuration resourcesURL , '/Dependencies/ChartJsLibrary/Chartmin.js'.
	anHtmlRoot script url: self configuration resourcesURL , '/Dependencies/ChartJsLibrary/extChart.js'.
	anHtmlRoot script url: self configuration resourcesURL , '/Dependencies/ChartJsLibrary/post.js'.
	self isLogged
		ifFalse: [ anHtmlRoot bodyAttributes addClass: 'no-padding' ]