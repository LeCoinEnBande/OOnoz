rendering
renderPossibilitiesOn: html
	html tbsRow
		class: 'possibilities';
		with: [ self charts
				do: [ :class | 
					html
						tbsColumn: [ html anchor
								callback: [ self selectedChart: class ];
								with: [ html figure
										class: 'thumbnail';
										class: 'grid-item';
										with: [ html image url: self configuration resourcesURL , '/images/' , class image.
											html
												figureCaption: [ html heading
														level3;
														with: class title.
													html paragraph: class description ] ] ] ]
						mediumSize: 4 ] ]