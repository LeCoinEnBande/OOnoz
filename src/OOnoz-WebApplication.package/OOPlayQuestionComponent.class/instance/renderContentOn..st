as yet unclassified
renderContentOn: html
	html article
		class: #panel;
		class: #'panel-default';
		with: [ | id |
			html header
				id: 'QuestionTitle' , self index asString;
				class: #'panel-heading';
				role: #tab;
				attributeAt: #'data-toggle' put: #collapse;
				attributeAt: #'data-parent' put: #'#questionsList';
				attributeAt: #'data-target' put: '#' , (id := html nextId);
				ariaExpanded: true;
				ariaControles: id;
				with: [ html tbsPanelTitle
						level3;
						with: 'Question ' , self index asString ].
			html div
				id: id;
				class: #'panel-collapse';
				class: #collapse;
				class: #in;
				role: #tabpanel;
				ariaLabelledBy: 'QuestionTitle' , self index asString;
				with: [ html section
						class: #'panel-body';
						with: [ html header: self question description ] ] ]