rendering
renderBadgeOn: html
	| finished |
	finished := self mcq gift winners size.
	html tbsBadge
		beSuccessIf: finished = self mcq gift number;
		beDangerIf: finished ~= self mcq gift number;
		with: finished greaseString , '/' , self mcq gift number greaseString