javascript
refreshBadgeScriptOn: html
	^ (html jQuery id: self badgeId) load
		html: [ :r | self renderValidationBadgeOn: r ]