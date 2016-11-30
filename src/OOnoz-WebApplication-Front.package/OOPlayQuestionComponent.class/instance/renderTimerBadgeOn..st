rendering
renderTimerBadgeOn: html
	self mcq isChallenge ifFalse: [ ^ self ].
	
	html tbsBadge
		class: #'oonoz-timer';
		class: 'timer' , self index greaseString;
		attributeAt: 'data-time' put: self mcq timeByQuestion asSeconds.
	html space