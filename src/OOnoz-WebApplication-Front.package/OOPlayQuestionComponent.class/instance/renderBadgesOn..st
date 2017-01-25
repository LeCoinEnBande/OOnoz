rendering
renderBadgesOn: html
	html div
		tbsPullRight;
		class: #'oonoz-badges';
		with: [ self renderTimerBadgeOn: html.
			html div
				id: self badgeId;
				with: [ self renderValidationBadgeOn: html ] ]