rendering
renderGenderInputOn: html
	| group |
	group := html radioGroup.
	OOUser genders
		keysAndValuesDo: [ :gender :label | 
			html label
				class: #'radio-inline';
				with: [ group radioButton
						selected: self user gender = gender;
						callback: [ self user gender: gender ];
						with: label ] ]