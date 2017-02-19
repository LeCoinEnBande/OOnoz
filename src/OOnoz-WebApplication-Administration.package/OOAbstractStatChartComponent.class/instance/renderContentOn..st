rendering
renderContentOn: html
	self mcqInputCache: nil.
	html tbsRow: [ self renderButtonsOn: html ].
	self renderHookOn: html.
	html
		tbsRow: [ html tbsColumn
				id: #'chart-stat';
				mediumSize: 10;
				with: [ self renderChartOn: html ].
			html tbsColumn: [ html form: [ html render: self mcqFilter ] ] mediumSize: 2 ].
	html document
		addLoadScript: '$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)});$(".material-switch").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)})' js