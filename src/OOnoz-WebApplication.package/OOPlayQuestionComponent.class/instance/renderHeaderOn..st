rendering
renderHeaderOn: html
	html header
		id: self titleId;
		class: #'panel-heading';
		class: #collapsed if: self isFirst not;
		role: #tab;
		attributeAt: #'data-toggle' put: #collapse;
		attributeAt: #'data-parent' put: #'#questionsList';
		attributeAt: #'data-target' put: '#' , self id;
		ariaExpanded: self isFirst;
		ariaControles: self id;
		with: [ html tbsPanelTitle
				level3;
				with: 'Question ' , self index asString ]