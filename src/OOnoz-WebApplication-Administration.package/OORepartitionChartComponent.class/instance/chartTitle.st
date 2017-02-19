rendering
chartTitle
	^ String
		streamContents: [ :s | 
			s
				<< 'Répartition des QCMs parmis ';
				<< self values size;
				space;
				<<
					((self mode = #thèmes and: [ self selectedTheme isNotNil ])
						ifTrue: [ 'sous-thèmes de ' , self selectedTheme title ]
						ifFalse: [ self mode ]) ]