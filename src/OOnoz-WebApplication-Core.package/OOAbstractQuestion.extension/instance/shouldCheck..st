*OOnoz-WebApplication-Core
shouldCheck: anAnswer
	^ anAnswer isRight
		or: [ anAnswer index = 1
				and: [ self answers
						detect: [ :ans | ans isRight ]
						ifFound: [ false ]
						ifNone: [ true ] ] ]