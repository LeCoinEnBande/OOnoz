rendering
renderContentOn: html
	self mcq isChallenge
		ifFalse: [ ^ self ].
	html hr.
	html
		tbsFormGroup: [ html
				section: [ html heading
						level3;
						with: 'Temps par question'.
					html break.
					html textInput
						tbsFormControl;
						id: html lastId;
						class: #slider;
						callback: [ :time | self mcq timeByQuestion: (Duration seconds: time asInteger) ];
						attributeAt: 'data-provide' put: 'slider';
						attributeAt: 'data-slider-id' put: html nextId;
						attributeAt: 'data-slider-min' put: '30';
						attributeAt: 'data-slider-max' put: '600';
						attributeAt: 'data-slider-ticks' put: '[30,450,900,1350,1800]';
						attributeAt: 'data-slider-ticks-labels' put: '["30sec","7min30","15min","22min30","30min"]';
						attributeAt: 'data-slider-step' put: '30';
						attributeAt: 'data-slider-value' put: self mcq timeByQuestion asSeconds asString ] ].
	html render: self giftComponent