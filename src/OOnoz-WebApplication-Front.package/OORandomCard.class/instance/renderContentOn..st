rendering
renderContentOn: html
	html anchor
		callback: [ self page call: (OOPlayComponent mcq: self scope atRandom) ];
		with: [ html figure
				class: 'thumbnail';
				class: 'grid-item';
				style: 'border: 3px solid #1abc9c;';
				with: [ html image url: self themeMediaUrl.
					html
						figureCaption: [ html heading
								level3;
								with: self title.
							html paragraph: self description ] ] ]