rendering
renderContentOn: html
	html render: self header.
	(html tag: #main)
		with: [ html render: self component.
			self renderEmptyGenericDialogOn: html ].
	html anchor
		url: '#';
		class: 'btn btn-primary btn-top';
		id: 'goToTop';
		role: 'button';
		title: 'Revenir en haut de la page';
		attributeAt: 'data-toggle' put: 'tooltip';
		attributeAt: 'data-placement' put: 'left';
		with: [ (html tag: 'i')
				class: 'fa fa-chevron-up';
				ariaHidden: 'true' ].
	self addEndsScriptsOn: html