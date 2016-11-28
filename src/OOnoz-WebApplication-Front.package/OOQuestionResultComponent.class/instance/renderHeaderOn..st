rendering
renderHeaderOn: html
	html tbsArticlePanelHeader
		id: self titleId;
		toggle: #collapse;
		parent: #'#questionsList';
		target: self id;
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