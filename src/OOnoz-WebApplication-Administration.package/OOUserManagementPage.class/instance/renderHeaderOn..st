rendering
renderHeaderOn: html
	html
		tableRow: [ self columns
				do: [ :asso | 
					| th |
					th := html tableHeading.
					asso value
						ifTrue: [ th attributeAt: 'data-sortable' put: true ].
					th with: asso key ] ]