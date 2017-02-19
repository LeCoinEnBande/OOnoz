rendering
chartTitle
	^ String
		streamContents: [ :s | 
			s
				<< 'Crédits dépensés parmis ';
				<< self values key size;
				space;
				<<
					((self mode = #thèmes and: [ self selectedTheme isNotNil ])
						ifTrue: [ 'sous-thèmes de ' , self selectedTheme title ]
						ifFalse: [ self mode ]) ]