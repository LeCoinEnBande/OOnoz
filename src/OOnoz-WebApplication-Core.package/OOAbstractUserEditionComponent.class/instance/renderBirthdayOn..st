rendering
renderBirthdayOn: html
	html div
		class: #'input-group';
		class: #date;
		with: [ html
				tbsFormGroup: [ | id label |
					label := 'Date de naissance'.
					html label
						for: (id := html nextId);
						tbsScreenReaderOnly;
						with: label.
					html textInput
						tbsFormControl;
						id: id;
						required;
						placeholder: label;
						callback: [ :string | self user birthday: (Date fromDDMMYYY: string) ];
						value: (self user birthday ifNotNil: [ :date | date ddmmyyyy ]) ].
			html span
				class: #'input-group-addon';
				with: [ html tbsGlyphIcon class: 'glyphicon-th' ] ].
	html document
		addLoadScript:
			(JSStream
				on:
					(String
						streamContents: [ :s | 
							s
								<<
									'$(".input-group.date").datepicker({
    format: "dd/mm/yyyy",
    startDate: "01/01/1850",
    endDate: "';
								<< Date today ddmmyyyy;
								<<
									'",
    startView: 2,
    maxViewMode: 2,
    language: "fr",
    autoclose: true
});' ]))