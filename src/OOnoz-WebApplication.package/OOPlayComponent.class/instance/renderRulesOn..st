rendering
renderRulesOn: html
	html
		section: [ html
				tbsRow: [ self rulesAndDescriptions
						keysAndValuesDo: [ :title :description | 
							html
								tbsColumn: [ html
										article: [ html
												header: [ html heading
														level3;
														with: title ].
											html section: description ] ]
								mediumSize: 4 ] ] ]