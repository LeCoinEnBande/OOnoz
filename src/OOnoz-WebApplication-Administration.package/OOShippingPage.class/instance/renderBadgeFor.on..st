rendering
renderBadgeFor: aMCQ on: html
	| finished |
	finished := aMCQ gift winners size.
	html tbsBadge
		beSuccessIf: finished = aMCQ gift number;
		beDangerIf: finished ~= aMCQ gift number;
		with: finished greaseString , '/' , aMCQ gift number greaseString