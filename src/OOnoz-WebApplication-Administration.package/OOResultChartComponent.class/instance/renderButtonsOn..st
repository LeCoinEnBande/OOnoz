rendering
renderButtonsOn: html
	self selectedCol
		ifNotNil: [ html tbsAnchor
				beDanger;
				callback: [ self selectedCol: nil ];
				with: 'Retour aux fournisseurs' ]
		ifNil: [ super renderButtonsOn: html ].
	html space