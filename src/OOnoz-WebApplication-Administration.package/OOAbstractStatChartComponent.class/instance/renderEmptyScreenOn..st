rendering
renderEmptyScreenOn: html
	html tbsAlert
		style: 'margin-top: 20px;';
		beDanger;
		with: [ html strong: 'Aucun résultat. '.
			html text: 'Veuillez réduire la sévérité de vos filtres. ' ]