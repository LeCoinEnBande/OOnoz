rendering
renderAnswer: html on: anAnswer
	| id |
	id := html nextId.
	html mdlCheckboxContainer
		for: id;
		with: [ html mdlCheckbox
				id: id;
				callback: [ :confirmation | self userAnswers at: anAnswer put: confirmation ];
				disabled: self isValidated;
				value: (self userAnswers at: anAnswer ifAbsent: [ false ]).
			html mdlCheckboxLabel: anAnswer text ]