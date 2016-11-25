rendering
renderContentOn: html
	self flag: #todo.	"The active panel should be kept"
	self renderPanelHeaderOn: html.
	html div
		id: self id;
		class: #'panel-collapse';
		class: #collapse;
		class: #in if: self index = 1;
		role: #tabpanel;
		ariaLabelledBy: self titleId;
		with: [ html section
				class: #'panel-body';
				with: [ html
						section: [ self renderToolbarOn: html.
							html tbsTable
								class: #'table-no-bordered';
								attributeAt: #'data-toggle' put: 'table';
								attributeAt: #'data-search' put: 'true';
								attributeAt: #'data-pagination' put: 'true';
								attributeAt: 'data-toolbar' put: '#' , self toolbarId;
								with: [ html tableHead: [ self renderTableHeaderOn: html ].
									html
										tableBody: [ self mcq gift winners
												do: [ :user | html tableRow: [ (self tableEntriesFrom: user on: html) do: [ :content | html tableData: content ] ] ] ] ] ] ] ]