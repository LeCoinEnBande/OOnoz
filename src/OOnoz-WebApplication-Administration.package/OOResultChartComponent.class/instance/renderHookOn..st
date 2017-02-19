rendering
renderHookOn: html
	html
		form: [ html text: 'Note miniale de réussite '.
			html
				tbsFormGroup: [ html textInput
						tbsFormControl;
						class: #slider;
						callback: [ :rate | self successRate: rate asInteger ];
						onChange:
							(html jQuery ajax
								serializeThis;
								onSuccess:
									((html jQuery: #'chart-stat') load
										html: [ :r | 
											self renderChartOn: r.
											self valuesCache: nil ]));
						attributeAt: 'data-provide' put: 'slider';
						attributeAt: 'data-slider-id' put: html nextId;
						attributeAt: 'data-slider-min' put: '-20';
						attributeAt: 'data-slider-max' put: '20';
						attributeAt: 'data-slider-ticks' put: '[-20,-10,0,10,20]';
						attributeAt: 'data-slider-ticks-labels' put: '["-20","-10","0","10","20"]';
						attributeAt: 'data-slider-step' put: '1';
						attributeAt: 'data-slider-value' put: self successRate asString ] ]