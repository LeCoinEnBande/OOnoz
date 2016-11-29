rendering
renderComponentOn: html
	html
		tbsContainer: [ html tbsAlert
				beDanger;
				beDismissible;
				role: #alert;
				with: [ html tbsDismissAlertButton.
					html strong: 'Cette page changera totalement dans la livraison du lot 2.' ].
			html
				section: [ | toolbarId |
					self renderToolbarFor: (toolbarId := #toolbar) on: html.
					html tbsTable
						class: #'table-no-bordered';
						attributeAt: #'data-toggle' put: 'table';
						attributeAt: #'data-search' put: 'true';
						attributeAt: #'data-pagination' put: 'true';
						attributeAt: 'data-toolbar' put: '#' , toolbarId;
						with: [ html tableHead: [ self renderHeaderOn: html ].
							html
								tableBody: [ OOUser selectAll
										do: [ :theme | html tableRow: [ (self tableEntriesFrom: theme On: html) do: [ :content | html tableData: content ] ] ] ] ] ] ]