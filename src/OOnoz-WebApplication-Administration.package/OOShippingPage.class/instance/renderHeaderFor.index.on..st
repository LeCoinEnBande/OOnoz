rendering
renderHeaderFor: aMCQ index: anInteger on: html
	html header
		id: (self titleIdFor: anInteger);
		class: #'panel-heading';
		role: #tab;
		attributeAt: #'data-parent' put: #'#mcqsList';
		attributeAt: #'data-toggle' put: #collapse;
		attributeAt: #'data-target' put: '#' , (self idFor: anInteger);
		ariaExpanded: anInteger = 1;
		ariaControles: (self idFor: anInteger);
		with: [ html tbsPanelTitle
				level3;
				with: [ html text: 'Challenge: ' , aMCQ title.
					html div
						tbsPullRight;
						class: #'oonoz-badges';
						with: [ self renderBadgeFor: aMCQ on: html ] ] ]