rendering
renderPanelContentOn: html
	self renderHeaderOn: html.
	html div
		id: self id;
		class: #'panel-collapse';
		class: #collapse;
		class: #in if: self isActive;
		role: #tabpanel;
		with: [ self renderErrorOn: html.
			self renderFormContentOn: html ]