rendering
renderHeaderOn: html
	html header
		id: self titleId;
		class: #'panel-heading';
		class: #'playing-question';
		role: #tab;
		attributeAt: #'data-parent' put: #'#questionsList' if: self mcq isChallenge not;
		attributeAt: #'data-toggle' put: #collapse if: self mcq isChallenge not;
		attributeAt: #'data-target' put: '#' , self id;
		ariaExpanded: self isActive;
		ariaControles: self id;
		onClick: (html jQuery ajax callback: [ self headerClickAction ]) if: true;
		with: [ html tbsPanelTitle
				level3;
				with: [ html text: 'Question ' , self index greaseString.
					html div
						tbsPullRight;
						class: #'oonoz-badges';
						with: [ self renderBadgesOn: html ] ] ]