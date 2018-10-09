Extension { #name : #OOAbstractQuestion }

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractQuestion >> addEmptyAnswer [
	self
		addAnswer:
			(OOAnswer new
				index: ((1 to: self class maximumNumberOfAnswers) \ (self answers collect: #index)) first;
				yourself)
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractQuestion class >> description [
	^ self subclassResponsibility
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractQuestion class >> label [
	^ self subclassResponsibility
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractQuestion >> renderAnswersFrom: aComponent on: html [
	self subclassResponsibility
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractQuestion >> renderDeleteButtonFor: anAnswer from: aComponent on: html [
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
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractQuestion >> renderLabelFor: answer id: anId on: html [
	html label
		for: anId;
		with: [ html span
				tbsScreenReaderOnly;
				with: 'Proposition ' , answer index asString ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractQuestion >> renderTextInputFor: anAnswer from: aComponent on: html [
	html textInput
		tbsFormControl;
		value: anAnswer text;
		placeholder: 'Proposition ' , anAnswer index asString;
		onChange:
			(html jQuery ajax
				serializeThis;
				onSuccess: (aComponent refreshBadgeOn: html));
		callback: [ :text | anAnswer text: text ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOAbstractQuestion >> uiDescription [
	^ self subclassResponsibility
]
