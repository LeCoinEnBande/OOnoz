rendering
renderButtonsOn: html
	html div
		style: 'margin: 10px;';
		with: [ html tbsAnchor
				bePrimary;
				dataToggle: 'modal';
				dataTarget: '#' , html nextId;
				with: 'Finir'.
			self renderCancelModalFor: html lastId on: html ]