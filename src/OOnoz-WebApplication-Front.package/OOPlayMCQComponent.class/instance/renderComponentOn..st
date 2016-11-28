rendering
renderComponentOn: html
	html
		tbsContainer: [ html render: (OOMCQHeaderComponent mcq: self mcq) ].
	html
		tbsContainer: [ html form
				role: #form;
				with: [ html section
						class: #'panel-group';
						id: #questionsList;
						role: #tablist;
						ariaMultiselectable: true;
						with: [ self questions do: [ :q | html render: q ] ].
					html document addLoadScript: self initCheckboxesJs.
					html
						section: [ html div
								tbsPullRight;
								with: [ self renderButtonsOn: html ] ] ] ].
	self mcq isChallenge
		ifTrue: [ html document addLoadScript: 'initalizeClock();launchClock(1);' js ]