rendering
renderChallengeOptionsOn: html
	self mcq isChallenge
		ifFalse: [ ^ self ].
	html hr.
	html
		tbsFormGroup: [ html label
				for: html nextId;
				with: 'Temps par question'.
			html break.
			html textInput
				tbsFormControl;
				id: html lastId;
				class: #slider;
				callback: [ :time | self mcq timeByQuestion: (Duration seconds: time asInteger) ];
				attributeAt: 'data-provide' put: 'slider';
				attributeAt: 'data-slider-id' put: html lastId;
				attributeAt: 'data-slider-min' put: '30';
				attributeAt: 'data-slider-max' put: '600';
				attributeAt: 'data-slider-ticks' put: '[30,150,300,450,600]';
				attributeAt: 'data-slider-ticks-labels'
					put: '["30sec","2min30","5min","7min30","10min"]';
				attributeAt: 'data-slider-step' put: '10';
				attributeAt: 'data-slider-value' put: self mcq timeByQuestion asSeconds asString ].
	html
		tbsFormGroup: [ html label
				for: html nextId;
				with: #Prix:.
			html break.
			html textInput
				tbsFormControl;
				id: html lastId;
				class: #slider;
				callback: [ :price | self mcq price: price asInteger ];
				attributeAt: 'data-provide' put: 'slider';
				attributeAt: 'data-slider-id' put: html lastId;
				attributeAt: 'data-slider-min' put: '0';
				attributeAt: 'data-slider-max' put: '20';
				attributeAt: 'data-slider-ticks' put: '[0,5,10,15,20]';
				attributeAt: 'data-slider-ticks-labels' put: '["0C","5C","10C","15C","20C"]';
				attributeAt: 'data-slider-step' put: '1';
				attributeAt: 'data-slider-value' put: self mcq price asString ].
	html
		tbsFormGroup: [ | label |
			label := 'Description du cadeau'.
			html label
				for: html nextId;
				tbsScreenReaderOnly;
				with: label.
			html textArea
				tbsFormControl;
				id: html lastId;
				placeholder: label;
				callback: [ :gift | gift ifNotEmpty: [ self mcq gift: gift ] ];
				value: self mcq gift;
				rows: 1 ]