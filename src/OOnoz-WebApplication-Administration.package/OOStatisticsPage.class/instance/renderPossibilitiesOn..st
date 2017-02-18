rendering
renderPossibilitiesOn: html
	^ html
		tbsRow: [ self charts
				do: [ :class | 
					html
						tbsColumn: [ html anchor
								callback: [ self selectedChart: class ];
								with: [ html figure
										class: 'thumbnail';
										class: 'grid-item';
										with: [ html
												figureCaption: [ html heading
														level3;
														with: class title.
													html paragraph: class description ] ] ] ]
						mediumSize: 4 ] ]