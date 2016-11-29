*OOnoz-WebApplication-Core
renderDeleteButtonFor: anAnswer from: aComponent on: html
	self answers size > self questionClass minimumNumberOfAnswers
		ifFalse: [ ^ self ].
	html
		tbsInputGroupButton: [ html tbsButton
				bePush;
				beDanger;
				beLink;
				onClick: (aComponent refreshDoing: [ self removeAnswer: anAnswer ] on: html);
				with: [ (html tag: #i)
						class: 'fa fa-times';
						ariaHidden: true ] ]