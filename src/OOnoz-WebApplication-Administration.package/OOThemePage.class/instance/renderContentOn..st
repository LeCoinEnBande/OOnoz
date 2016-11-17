rendering
renderContentOn: html
	html
		tbsContainer: [ self renderTitleAndDescriptionOn: html.
			self renderMessageOn: html.
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
								tableBody: [ self themes do:
										[ :theme | html tableRow: [ (self tableEntriesFrom: theme On: html) do: [ :content | html tableData: content ] ] ] ] ] ] ]