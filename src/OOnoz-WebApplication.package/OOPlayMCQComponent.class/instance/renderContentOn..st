rendering
renderContentOn: html
	html form
		role: #form;
		with: [ html section
				class: #'panel-group';
				id: #questionsList;
				role: #tablist;
				ariaMultiselctable: true;
				with: [ self questions do: [ :q | html render: q ] ].
			html tbsAnchor
				beOutline;
				beSuccess;
				callback: [ self finish ];
				with: 'Terminer' ]