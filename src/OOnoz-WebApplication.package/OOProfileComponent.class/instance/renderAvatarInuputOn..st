rendering
renderAvatarInuputOn: html
	self flag: #todo.
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
							style: 'height: 100px; width: 100px;';
								url:
									self configuration avatarsURL
										,
											(self user hasAvatar
												ifFalse: [ 'default.png' ]
												ifTrue: [ self user mail ]).
							html fileUpload
								class: 'toHide';
								callback: [ :file | self updateAvatar: file ] ] ] ]