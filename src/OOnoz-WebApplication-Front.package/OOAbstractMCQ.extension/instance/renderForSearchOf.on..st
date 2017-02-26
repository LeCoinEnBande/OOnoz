*OOnoz-WebApplication-Front
renderForSearchOf: aComponent on: html
	html anchor
		callback: [ aComponent select: self ];
		with: [ html figure
				class: 'thumbnail';
				class: 'grid-item';
				with: [ html image url: self backgroundMediaUrl.
					html div
						style: 'margin-top: 5px;';
						with: [ html tbsLabel
								beInfo;
								with:
									self price greaseString , ' crédit'
										,
											(self price > 1
												ifTrue: [ 's' ]
												ifFalse: [ '' ]).
							html space.
							html tbsLabel
								beDefault;
								class: 'label-difficulty-' , self level asString;
								with: 'Niveau ' , self level asString.
							html space.
							html tbsLabel
								bePrimary;
								with: self class kind ].
					html
						figureCaption: [ html heading
								level3;
								with: self title.
							html paragraph: self description ] ] ]