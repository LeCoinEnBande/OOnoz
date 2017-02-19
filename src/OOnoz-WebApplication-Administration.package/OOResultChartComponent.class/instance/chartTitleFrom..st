rendering
chartTitleFrom: datas
	^ String
		streamContents: [ :s | 
			s
				<< 'Taux de completion et de réussite des QCMs de ';
				<< (self selectedCol ifNil: [ datas size asString , ' fournisseurs.' ] ifNotNil: #displayName) ]