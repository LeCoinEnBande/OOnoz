rendering
searchFieldLabel
	^ String
		streamContents: [ :s | 
			s
				<< 'Rechercher parmis les ';
				<< self inputEntities size;
				<< ' ';
				<< self entityName pluralize ]