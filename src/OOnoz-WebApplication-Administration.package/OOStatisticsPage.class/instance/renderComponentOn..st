rendering
renderComponentOn: html
	html
		tbsContainer: [ html tbsRow: [ html text: 'test' ].
			html
				tbsRow: [ html
						tbsColumn: [ html
								tbsListGroup: [ charts
										do: [ :chart | 
											html anchor
												callback: [ self selectedChart: chart ];
												with: [ html tbsListGroupItem: chart title ] ] ] ]
						mediumSize: 2.
					html tbsColumn: [ html render: self selectedChart ] mediumSize: 10 ] ]