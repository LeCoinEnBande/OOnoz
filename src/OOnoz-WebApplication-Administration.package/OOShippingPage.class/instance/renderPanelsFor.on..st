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
						with: [ html render: (OOShippingMCQComponent mcq: mcq index: i) ] ] ]