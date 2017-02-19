rendering
renderAvatarInuputOn: html
	self flag: #clean.
	html
		tbsContainer: [ html heading
				level2;
				class: #h5;
				with: 'Avatar'.
			html
				tbsRow: [ html
						tbsColMs: 6
						mo: 3
						with: [ html image
								style: 'height: 100px; width: 100px; border-radius:5000px';
								url: (self user avatarUrlFrom: self configuration).
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