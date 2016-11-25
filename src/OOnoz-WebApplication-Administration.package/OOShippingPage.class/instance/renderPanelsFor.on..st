rendering
renderPanelsFor: aCollectionOfMCQs on: html
	html section
		class: #'panel-group';
		id: #mcqsList;
		role: #tablist;
		ariaMultiselectable: true;
		with: [ aCollectionOfMCQs
				doWithIndex: [ :mcq :i | 
					html article
						class: #panel;
						class: #'panel-default';
						with: [ self renderPanelFor: mcq index: i on: html ] ] ]