rendering
renderPanelFor: aMCQ index: anInteger on: html
	self flag: #todo.	"This should be in another component."
	self flag: #todo.	"The active panel should be kept"
	self renderHeaderFor: aMCQ index: anInteger on: html.
	html div
		id: (self idFor: anInteger);
		class: #'panel-collapse';
		class: #collapse;
		class: #in if: anInteger = 1;
		role: #tabpanel;
		ariaLabelledBy: (self titleIdFor: anInteger);
		with: [ html section
				class: #'panel-body';
				with: [  ] ]