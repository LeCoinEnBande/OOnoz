rendering
renderHeaderOn: html
	html header
		id: self titleId;
		class: #'panel-heading';
		role: #tab;
		attributeAt: #'data-toggle' put: #collapse;
		attributeAt: #'data-parent' put: #'#questionsList';
		attributeAt: #'data-target' put: '#' , self id;
		ariaExpanded: true;
		ariaControles: self id;
		with: [ html tbsPanelTitle
				level3;
				with: [ html text: 'Question ' , self index greaseString.
					html div
						tbsPullRight;
						with: [ html tbsBadge
								beSuccessIf: self result isCorrect;
								beDangerIf: self result isCorrect not;
								with: self result printResult ] ] ]