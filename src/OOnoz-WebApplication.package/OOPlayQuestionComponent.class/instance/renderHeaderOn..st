rendering
renderHeaderOn: html
	html header
		id: self titleId;
		class: #'panel-heading';
		class: #'playing-question';
		class: #collapsed if: self isActive not;
		role: #tab;
		attributeAt: #'data-toggle' put: #collapse;
		attributeAt: #'data-parent' put: #'#questionsList';
		attributeAt: #'data-target' put: '#' , self id;
		ariaExpanded: self isActive;
		ariaControles: self id;
		onClick:
			(html jQuery ajax callback:
				[ self headerClickAction ])
			if: true;
		with: [ html tbsPanelTitle
				level3;
				with: 'Question ' , self index greaseString ]