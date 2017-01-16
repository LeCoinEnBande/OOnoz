rendering
renderMCQLevelOn: html
	html
		tbsColumn: [ html
				section: [ html heading
						level3;
						with: 'Difficulté'.
					html
						section: [ html
								tbsFormGroup: [ html textInput
										tbsFormControl;
										class: #slider;
										callback: [ :level | self mcq level: level asInteger ];
										attributeAt: 'data-provide' put: 'slider';
										attributeAt: 'data-slider-id' put: html lastId;
										attributeAt: 'data-slider-min' put: '1';
										attributeAt: 'data-slider-max' put: '5';
										attributeAt: 'data-slider-ticks' put: '[1,2,3,4,5]';
										attributeAt: 'data-slider-ticks-labels' put: '["1","2","3","4","5"]';
										attributeAt: 'data-slider-step' put: '1';
										attributeAt: 'data-slider-value' put: self mcq level asString ] ] ] ]
		mediumSize: 6