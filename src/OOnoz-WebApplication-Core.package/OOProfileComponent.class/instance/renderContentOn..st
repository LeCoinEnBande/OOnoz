rendering
renderContentOn: html
	html
		tbsContainer: [ html
				tbsRow: [ html
						tbsColMs: 8
						mo: 2
						with: [ self renderAvatarManagementOn: html.
							html hr.
							html
								form: [ self renderFormContentOn: html.
									self renderButtonsOn: html ].
							html hr.
							html render: self changePasswordComponent ] ] ]