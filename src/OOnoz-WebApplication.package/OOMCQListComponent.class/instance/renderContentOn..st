rendering
renderContentOn: html
	self renderTitleAndDescriptionOn: html.
	html
		section: [ | toolbarId |
			self renderToolbarFor: (toolbarId := #toolbar) on: html.
			html tbsTable
				class: #'table-no-bordered';
				attributeAt: #'data-toggle' put: 'table';
				attributeAt: #'data-search' put: 'true';
				attributeAt: #'data-pagination' put: 'true';
				attributeAt: 'data-toolbar' put: toolbarId;
				with: [ html
						tableHead: [ html
								tableRow: [ html tableHeading attributeAt: 'data-checkbox' put: 'true'.
									#('Nom' 'Communauté' 'Type' 'Prix' 'Complété' 'Ouvert' 'Actions') do: [ :title | html tableHeading: title ] ] ].
					html
						tableBody: [ self currentUser mcqs
								do: [ :mcq | 
									html
										tableRow: [ {''.
											mcq title.
											[ html tbsLabel
												bePrimary;
												with: 'Rien'.
											html tbsLabel
												beDefault;
												with: 'Rien' ].
											'Pas fait'.
											[ html tbsLabel
												beInfo;
												with: 'TODO' ].
											[ html tbsLabel
												beInfo;
												with: 'TODO' ].
											[ html tbsLabel
												beSuccess;
												with: 'TODO' ].
											'TODO'} do: [ :content | html tableData: content ] ] ] ] ] ]