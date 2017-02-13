rendering
renderCGUOn: html
	html tbsFormGroup
		class: 'checkbox';
		with: [ html checkbox
				id: html nextId;
				value: false.
			html label
				id: 'cguLabel';
				for: html lastId;
				with: [ html text: 'J''accepte les '.
					html anchor
						onClickUpdateRootDialogWith: [ :r | self renderCGUModalOn: r ];
						with: 'conditions d''utilisation'.
					html text: ' de OOnoz.' ] ]