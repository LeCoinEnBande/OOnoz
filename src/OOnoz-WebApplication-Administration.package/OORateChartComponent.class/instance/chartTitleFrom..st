rendering
chartTitleFrom: datas
	^ String
		streamContents: [ :s | 
			s
				<< 'Notes des QCMs parmis les ';
				<< datas size;
				space;
				<<
					((self mode = #thèmes and: [ self selectedTheme isNotNil ])
						ifTrue: [ 'sous-thèmes de ' , self selectedTheme title ]
						ifFalse: [ self mode ]) ]