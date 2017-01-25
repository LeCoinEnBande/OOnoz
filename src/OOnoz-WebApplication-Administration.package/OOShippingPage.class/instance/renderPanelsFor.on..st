rendering
renderPanelsFor: aCollectionOfMCQs on: html
	html
		tbsPanelGroupId: #mcqsList
		with: [ aCollectionOfMCQs
				doWithIndex: [ :mcq :i | 
					html tbsArticlePanel
						beDefault;
						with: [ html render: (OOShippingMCQComponent mcq: mcq index: i) ] ] ]