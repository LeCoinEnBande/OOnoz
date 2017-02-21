rendering
renderContentOn: html
	self mcqInputCache: nil.
	html
		tbsRow: [ html heading
				level3;
				with: [ html text: self chartTitle.
					5 timesRepeat: [ html space ].
					self renderButtonsOn: html ] ].
	html
		tbsRow: [ html
				tbsColumn: [ html form
						id: #'chart-all';
						with: [ self renderFormContentOn: html ] ]
				mediumSize: 2.
			html tbsColumn
				id: #'chart-stat';
				mediumSize: 10;
				with: [ self renderChartOn: html.
					self valuesCache: nil ] ].
	html document
		addLoadScript:
			'$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)});$(".material-switch").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)})'
				js