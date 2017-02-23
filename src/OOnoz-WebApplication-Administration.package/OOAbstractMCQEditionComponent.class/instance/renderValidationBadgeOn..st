rendering
renderValidationBadgeOn: html
	html div
		class: 'text-success' if: self isValid;
		class: 'text-danger' if: self isValid not;
		with: [ (html tag: 'i')
				class: 'fa';
				class: 'fa-lg';
				class:
					(self isValid
						ifTrue: [ 'fa-check-circle-o' ]
						ifFalse: [ 'fa-times-circle-o' ]) ]