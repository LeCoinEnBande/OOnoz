rendering
renderContentOn: html
	html article
		class: #panel;
		class: #'panel-default';
		with: [ html header
				id: 'questionTitle' , self index greaseString;
				class: #'panel-heading';
				role: #tab;
				attributeAt: #'data-parent' put: #'#mcqCreation';
				attributeAt: #'data-toggle' put: #collapse;
				attributeAt: #'data-target' put: '#' , self id;
				ariaExpanded: true;
				ariaControles: self id;
				with: [ html tbsPanelTitle
						level2;
						with: 'Question ' , self index asString ].
			self renderErrorOn: html.
			html div
				id: self id;
				class: #'panel-collapse';
				class: #collapse;
				class: #in;
				role: #tabpanel;
				ariaLabelledBy: 'questionTitle' , self index greaseString;
				with: [ self renderFormContentOn: html ] ]