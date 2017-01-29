*OOnoz-WebApplication-Front
renderForSearchOf: aComponent on: html
	html anchor
		callback: [ aComponent select: self ];
		with: [ html figure
				class: 'thumbnail';
				class: 'grid-item';
				with: [ html image url: self themeMediaUrl.
					html
						figureCaption: [ html heading
								level3;
								with: self title.
							html paragraph: self description ] ] ]