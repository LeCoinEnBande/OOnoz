rendering
renderSearchOptionsOn: html
	html
		tbsRow: [ html
				tbsColMs: 10
				mo: 1
				with: [ html
						tbsWell: [ html div
								tbsPullRight;
								with: [ html tbsGlyphIcon
										iconChevronUp;
										style: 'cursor: pointer;';
										onClick:
											'if(this.classList.contains("glyphicon-chevron-up")){this.classList.add("glyphicon-chevron-down");this.classList.remove("glyphicon-chevron-up");}else{this.classList.add("glyphicon-chevron-up");this.classList.remove("glyphicon-chevron-down");}$("#mcq-options").fadeToggle(1000);' js ].
							html heading
								level5;
								with: 'Options de recherche'.
							html div
								style: 'display:flex;justify-content: space-between;align-items: center;flex-wrap: wrap;';
								id: #'mcq-options';
								with: [ self randomScope ifNotEmpty: [ :scope | html div: [ html render: (OORandomButton scope: scope page: self page) ] ].
									self renderOptionsHookOn: html ] ] ] ]