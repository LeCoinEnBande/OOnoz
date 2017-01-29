rendering
renderQueryResultContentOn: html
	self randomScope ifNotEmpty: [ :scope | html render: (OORandomCard scope: scope page: self page) ].
	(self entitiesCached first: (15 min: self entitiesCached size)) do: [ :entity | entity renderForSearchOf: self on: html ]