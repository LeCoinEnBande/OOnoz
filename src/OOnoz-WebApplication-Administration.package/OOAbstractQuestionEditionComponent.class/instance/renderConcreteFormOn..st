rendering
renderConcreteFormOn: html
	self question class isAbstract
		ifTrue: [ ^ self ].
	html
		tbsFormGroup: [ | id label |
			label := 'Intitulé de la question ' , self question index asString.
			html label
				for: (id := html nextId);
				tbsScreenReaderOnly;
				with: label.
			html textInput
				tbsFormControl;
				id: id;
				required;
				placeholder: label;
				callback: [ :title | self question description: title ];
				onChange:
					(html jQuery ajax
						serializeThis;
						onSuccess: (self refreshBadgeScriptOn: html));
				value: self question description ].
	html div
		id: self answersId;
		with: [ self renderAnswersOn: html ]