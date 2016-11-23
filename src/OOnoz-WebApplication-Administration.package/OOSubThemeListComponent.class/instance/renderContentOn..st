rendering
renderContentOn: html
	html
		tbsContainer: [ self renderTitleOn: html.
			html
				section: [ | toolbarId |
					self renderToolbarFor: (toolbarId := #toolbarSubTheme) on: html.
					html tbsTable
						class: #'table-no-bordered';
						attributeAt: #'data-toggle' put: 'table';
						attributeAt: #'data-search' put: 'true';
						attributeAt: #'data-pagination' put: 'true';
						attributeAt: 'data-toolbar' put: '#' , toolbarId;
						with: [ html tableHead: [ self renderHeaderOn: html ].
							html
								tableBody: [ self subThemes do: [ :st | html tableRow: [ (self tableEntriesFrom: st On: html) do: [ :content | html tableData: content ] ] ] ] ] ] ]