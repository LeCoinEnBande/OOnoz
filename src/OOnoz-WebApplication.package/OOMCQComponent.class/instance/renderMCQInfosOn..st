rendering
renderMCQInfosOn: html
	html mdlCardTitleText
		class: #result;
		level: 3;
		with: self displayResult.
	^ html mdlCardTitleText
		class: #answered;
		level: 3;
		with: self displayAnswered