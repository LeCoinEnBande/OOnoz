public
delete: aTheme
	self flag: #todo.	"When we will be able to desable mcq, do it."
	(OOAbstractMCQ selectMany: [ :m | m theme = aTheme ])
		do: [ :m | 
			m resetSubThemes.
			m save ].
	aTheme remove