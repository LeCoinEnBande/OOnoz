rendering
values
	^ self mode = #thèmes
		ifTrue: [ (self selectedTheme
				ifNil: [ OOTheme selectAll asArray
						sortByTitle;
						collect: [ :theme | theme title -> (self mcqInput select: [ :mcq | mcq theme = theme ]) size ]
							thenReject: [ :asso | asso value = 0 ] ]
				ifNotNil: [ :theme | 
					theme subThemes asArray
						sortByTitle;
						collect: [ :subT | subT title -> (self mcqInput select: [ :mcq | mcq subThemes includes: subT ]) size ]
							thenReject: [ :asso | asso value = 0 ] ]) asArray ]
		ifFalse: [ OOUser selectAll asArray
				sort: [ :a :b | a displayName < b displayName ];
				collect: [ :user | user displayName -> (self mcqInput intersection: user mcqs) size ] thenReject: [ :asso | asso value = 0 ] ]