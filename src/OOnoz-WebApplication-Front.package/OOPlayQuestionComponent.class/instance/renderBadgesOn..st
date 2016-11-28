rendering
renderBadgesOn: html
	html tbsBadge
		class: #'oonoz-timer';
		class: 'timer' , self index greaseString;
		attributeAt: 'data-time' put: self mcq timeByQuestion asSeconds.
	html space.
	html div
		id: self badgeId;
		with: [ self renderValidationBadgeOn: html ]