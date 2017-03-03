rendering
renderEmptyContentOn: html
	html tbsRow
		class: #'text-center';
		with: [ html tbsAlert
				beWarning;
				with: 'Aucun cadeau à livrer.' ]