rendering
renderFormContentOn: html
	html heading
		class: 'text-center';
		level4;
		with: 'Informations'.
	self renderUserErrorOn: html.
	self renderInputsNameOn: html.
	self renderEmailInputOn: html.
	self renderPostalAdresseOn: html.
	self renderBirthdayOn: html.
	self renderGenderInputOn: html.
	self renderRoleInputOn: html