rendering
setDataForCallBack: div html: html scrollCb: scrollCb
	div
		attributeAt: 'data-url' asSymbol put: html actionUrl asString;
		attributeAt: 'data-cbId' asSymbol put: scrollCb asString;
		attributeAt: 'data-listMaxSize' asSymbol put: self inputEntities size;
		attributeAt: 'data-lastIndexAsked' asSymbol put: '1';
		attributeAt: 'data-loadingstep' put: '15'