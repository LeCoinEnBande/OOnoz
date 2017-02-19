rendering
chartTitle
	^ String
		streamContents: [ :s | 
			s
				<< 'Taux de completion et de réussite des QCMs de ';
				<< (self selectedCol ifNil: [ self values key size asString , ' fournisseurs.' ] ifNotNil: #displayName) ]