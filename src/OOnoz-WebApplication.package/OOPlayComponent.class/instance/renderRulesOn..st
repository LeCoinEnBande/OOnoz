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
											html section
												class: #'text-justify';
												with: description ] ]
								mediumSize: 4 ] ] ]