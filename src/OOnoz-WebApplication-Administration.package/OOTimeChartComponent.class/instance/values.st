rendering
values
	^ valuesCache
		ifNil: [ valuesCache := self mode = #thèmes
				ifTrue: [ self selectedTheme
						ifNil: [ (OOTheme selectAll asArray
								sortByTitle;
								select: [ :theme | self mcqInput anySatisfy: [ :mcq | mcq theme = theme ] ]) -> [ :t | (self mcqInput select: [ :mcq | mcq theme = t ]) sum: #price ] ]
						ifNotNil: [ :theme | 
							(theme subThemes asArray
								sortByTitle;
								select: [ :st | self mcqInput anySatisfy: [ :mcq | mcq subThemes includes: st ] ]) -> [ :st | (self mcqInput select: [ :mcq | mcq subThemes includes: st ]) sum: #price ] ] ]
				ifFalse: [ (OOUser selectAll asArray
						sort: [ :a :b | a displayName < b displayName ];
						reject: [ :user | (self mcqInput intersection: user mcqs) isEmpty ]) -> [ :user | (self mcqInput intersection: user mcqs) sum: #price ] ] ]