rendering
tableEntriesFrom: mcq On: html
	^ {''.
	mcq title.
	[ html tbsLabel
		bePrimary;
		with: 'Rien'.
	html space.
	html tbsLabel
		beDefault;
		with: 'Rien' ].
	'Pas fait'.
	[ html tbsLabel
		beInfo;
		with: 'TODO' ].
	[ html tbsLabel
		beInfo;
		with: 'TODO' ].
	[ html tbsLabel
		beSuccess;
		with: 'TODO' ].
	[ html anchor
		callback: [ self flag: #todo ];
		with: [ html tbsGlyphIcon iconEdit ].
	html space.
	html anchor
		callback: [ self flag: #todo ];
		with: [ html tbsGlyphIcon iconTrash ] ]}