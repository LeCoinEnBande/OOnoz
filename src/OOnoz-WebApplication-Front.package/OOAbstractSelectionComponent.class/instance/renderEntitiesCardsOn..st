rendering
renderEntitiesCardsOn: html
	| scrollCb container |
	(container := html div)
		id: 'queryResult';
		attributeAt: 'data-columns' put: ''.
	scrollCb := self defineScrollCallbackOn: container.
	self setDataForCallBack: container html: html scrollCb: scrollCb.
	container with: [ self renderQueryResultContentOn: html ]