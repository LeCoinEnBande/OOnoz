rendering
renderAvatarInuputOn: html
	self flag: #clean.
	html
		tbsContainer: [ html heading
				level2;
				class: #h5;
				with: 'Avatar'.
			html
				tbsRow: [ html tbsColumn
						mediumSize: 6;
						mediumOffset: 3;
						with: [ html image
								style: 'height: 100px; width: 100px; border-radius:5000px';
								url:
									self configuration avatarsURL
										,
											(self user hasAvatar
												ifFalse: [ 'default.png' ]
												ifTrue: [ self user mail , '.png' ]).
							self renderAvatarErrorOn: html.
							html
								tbsFormGroup: [ html fileUpload
										class: 'toHide';
										style: 'display: inline-block;';
										onChange: 'submit()';
										callback: [ :file | self updateAvatar: file ].
									html paragraph
										class: #'help-block';
										with: 'Image au format png de moins de 1Mo.' ] ] ] ]