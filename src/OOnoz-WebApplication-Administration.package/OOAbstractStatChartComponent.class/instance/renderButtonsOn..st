rendering
renderButtonsOn: html
	html tbsAnchor
		beDanger;
		callback: [ self owner selectedChart: nil ];
		with: 'Retour'