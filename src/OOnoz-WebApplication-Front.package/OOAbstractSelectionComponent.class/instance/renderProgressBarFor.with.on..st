rendering
renderProgressBarFor: currentStep with: label on: html
	html tbsColumn
		extraSmallSize: 4;
		class: 'bs-wizard-step';
		class: 'complete' if: currentStep < self stepNumber;
		class: 'active' if: currentStep = self stepNumber;
		with: [ | anchor |
			html div
				beCentered;
				class: 'bs-wizard-stepnum';
				with: currentStep asString.
			html div
				class: 'progress';
				with: [ html div class: 'progress-bar' ].
			anchor := html anchor
				class: 'bs-wizard-dot';
				yourself.
			currentStep < self stepNumber
				ifTrue: [ anchor callback: [ self flag: #todo ] ].
			html div
				beCentered;
				class: 'bs-wizard-info';
				with: label ]