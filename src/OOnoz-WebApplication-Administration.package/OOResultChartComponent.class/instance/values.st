rendering
values
	^ self selectedCol
		ifNil: [ | users datas |
			users := OOUser selectAll asArray
				sortByDisplayName;
				select: [ :user | self mcqInput anySatisfy: [ :mcq | user mcqs includes: mcq ] ].
			datas := users
				collect: [ :user | 
					| mcqs |
					mcqs := self mcqInput intersection: user mcqs.
					Array
						with: (OOMCQResult count: [ :res | mcqs includes: res mcq ])
						with: (OOMCQResult count: [ :res | (mcqs includes: res mcq) and: [ res isFinished ] ])
						with: (OOMCQResult count: [ :res | (mcqs includes: res mcq) and: [ res isFinished and: [ res result >= self successRate ] ] ]) ].
			users
				-> (Array with: 'joués' -> (datas collect: #first) with: 'complétés' -> (datas collect: #second) with: 'réussis' -> (datas collect: #third)) ]
		ifNotNil: [ :user | 
			| mcqs datas |
			mcqs := user mcqs asArray
				sortByTitle;
				select: [ :m | self mcqInput anySatisfy: [ :mcq | mcq = m ] ].
			datas := mcqs
				collect: [ :m | 
					Array
						with: (OOMCQResult count: [ :res | m = res mcq ])
						with: (OOMCQResult count: [ :res | m = res mcq and: [ res isFinished ] ])
						with: (OOMCQResult count: [ :res | m = res mcq and: [ res isFinished and: [ res result >= self successRate ] ] ]) ].
			mcqs
				-> (Array with: 'joués' -> (datas collect: #first) with: 'complétés' -> (datas collect: #second) with: 'réussis' -> (datas collect: #third)) ]