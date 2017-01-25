javascript
refreshBadgeOn: html
	^ (html jQuery id: #badge) load html: [ :r | self renderValidationBadgeOn: r ]