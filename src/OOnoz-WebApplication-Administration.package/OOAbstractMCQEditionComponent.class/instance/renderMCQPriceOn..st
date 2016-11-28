rendering
renderMCQPriceOn: html
	html
		tbsColumn: [ html
				section: [ html heading
						level3;
						with: 'Prix'.
					html
						section: [ html
								tbsFormGroup: [ html textInput
										tbsFormControl;
										class: #slider;
										callback: [ :price | self mcq price: price asInteger ];
										attributeAt: 'data-provide' put: 'slider';
										attributeAt: 'data-slider-id' put: html lastId;
										attributeAt: 'data-slider-min' put: '0';
										attributeAt: 'data-slider-max' put: '20';
										attributeAt: 'data-slider-ticks' put: '[0,5,10,15,20]';
										attributeAt: 'data-slider-ticks-labels' put: '["0C","5C","10C","15C","20C"]';
										attributeAt: 'data-slider-step' put: '1';
										attributeAt: 'data-slider-value' put: self mcq price asString ] ] ] ]
		mediumSize: 6