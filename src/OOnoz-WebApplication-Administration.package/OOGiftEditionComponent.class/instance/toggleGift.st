action
toggleGift
	self mcq hasGift
		ifTrue: [ self mcq resetGift ]
		ifFalse: [ self mcq gift: OOGift new ]