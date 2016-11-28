rendering
renderContentOn: html
	html
		tbsRow: [ html
				tbsColumn: [ self renderGlobalConfigurationOn: html.
					self renderOtherOptionsOn: html ]
				mediumSize: 8.
			html
				tbsColumn: [ html
						header: [ html heading
								level3;
								with: 'Image d''illustration' ].
					html section
						id: self imageId;
						with: [ self renderImageOn: html ] ]
				mediumSize: 4 ]