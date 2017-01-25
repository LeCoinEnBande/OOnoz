rendering
renderHeaderOn: html
	html tbsArticlePanelHeader
		id: self titleId;
		class: #'playing-question';
		parent: #'#questionsList' if: self mcq isChallenge not;
		toggle: #collapse if: self mcq isChallenge not;
		target: self id;
		ariaExpanded: self isActive;
		ariaControles: self id;
		onClick: (html jQuery ajax callback: [ self headerClickAction ]) if: self mcq isChallenge;
		with: [ html tbsPanelTitle
				level3;
				with: [ html text: 'Question ' , self index greaseString.
					self renderBadgesOn: html ] ]