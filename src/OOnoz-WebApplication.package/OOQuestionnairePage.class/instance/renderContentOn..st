rendering
renderContentOn: html
	self renderTitleAndDescriptionOn: html.
	self hasNewMCQ
		ifTrue: [ html tbsAlert
				beInfo;
				with: [ html strong: 'Nouveau QCM créé.' ].
			self hasNewMCQ: false ].
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
					html tableBody: [ self currentUser mcqs do: [ :mcq | html tableRow: [ (self tableEntriesFrom: mcq On: html) do: [ :content | html tableData: content ] ] ] ] ] ]