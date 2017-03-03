rendering
renderAvatarInuputOn: html
	self flag: #clean.
	html image
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
				with: 'Image au format png de moins de 1Mo.' ]