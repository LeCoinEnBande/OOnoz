rendering
renderQueryResultContentOn: html
	
	(self entitiesCached first: (15 min: self entitiesCached size)) do: [ :entity | entity renderForSearchOf: self on: html ]