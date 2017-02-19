rendering
renderButtonsOn: html
	self selectedCol
		ifNotNil: [ html tbsAnchor
				beDanger;
				callback: [ self selectedCol: nil ];
				with: [ html span class: 'fa fa-arrow-up'.
					html text: ' Retour aux fournisseurs' ] ]
		ifNil: [ super renderButtonsOn: html ].
	html space