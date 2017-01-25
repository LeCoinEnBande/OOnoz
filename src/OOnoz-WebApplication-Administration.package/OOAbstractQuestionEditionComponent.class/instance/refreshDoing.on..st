javascript
refreshDoing: aBlock on: html
	^ (html jQuery id: self panelId) load
		html: [ :r | 
			aBlock value.
			self renderPanelContentOn: r ];
		onComplete: self initScript