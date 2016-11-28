rendering
renderContentOn: html
	html
		tbsContainer: [ html tbsAlert
				beDanger;
				beDismissible;
				role: #alert;
				with: [ html tbsDismissAlertButton.
					html strong: 'Cette page changera totalement dans la livraison du lot 2.' ] ]