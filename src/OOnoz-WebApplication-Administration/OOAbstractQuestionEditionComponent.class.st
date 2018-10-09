Class {
	#name : #OOAbstractQuestionEditionComponent,
	#superclass : #OOComponent,
	#instVars : [
		'question',
		'owner',
		'isActive'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #testing }
OOAbstractQuestionEditionComponent class >> isAbstract [
	^ self = OOAbstractQuestionEditionComponent 
]

{ #category : #'instance creation' }
OOAbstractQuestionEditionComponent class >> owner: aComponent question: aQuestion [
	^ self new
		owner: aComponent;
		question: aQuestion;
		yourself
]

{ #category : #comparing }
OOAbstractQuestionEditionComponent >> <= anObject [
	^ (self > anObject) not
]

{ #category : #comparing }
OOAbstractQuestionEditionComponent >> > anObject [
	^ self question index > anObject question index
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> activate [
	self isActive: true
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> answersId [
	^ self id , 'Answers'
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> badgeId [
	^ 'badge' , self index greaseString
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> desactivate [
	self isActive: false
]

{ #category : #action }
OOAbstractQuestionEditionComponent >> headerClickAction [
	self isActive ifTrue: [ ^ self ].
	
	self owner questionComponents detect: #isActive ifFound: [ :q | q desactivate ].
	self activate
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> id [
	^ 'question' , self index greaseString
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> index [
	^ self question index
]

{ #category : #javascript }
OOAbstractQuestionEditionComponent >> initScript [
	^ self owner initQuestionsScript
]

{ #category : #initialization }
OOAbstractQuestionEditionComponent >> initialize [
	super initialize.
	self desactivate
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> isActive [
	^ isActive
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> isActive: aBoolean [ 
	isActive := aBoolean
]

{ #category : #testing }
OOAbstractQuestionEditionComponent >> isLast [
	^ self index = OOMCQ maximumNumberOfQuestions
]

{ #category : #testing }
OOAbstractQuestionEditionComponent >> isValid [
	[ self question validate ]
		on: OOInvalidQuestion
		do: [ ^ false ].
	^ true
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> mcq [
	^ self owner mcq
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> owner [
	^ owner
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> panelId [
	^ 'panelQuestion' , self index greaseString
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> question [
	^ question
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> question: anObject [
	question := anObject
]

{ #category : #accessing }
OOAbstractQuestionEditionComponent >> questionKinds [
	^ OOAbstractQuestion allSubclasses
]

{ #category : #javascript }
OOAbstractQuestionEditionComponent >> refreshAnswersDoing: aBlock on: html [
	^ (html jQuery id: self answersId) load
		html: [ :r | 
			aBlock value.
			self renderAnswersOn: r ];
		onComplete: self initScript
]

{ #category : #javascript }
OOAbstractQuestionEditionComponent >> refreshBadgeOn: html [
	^ (html jQuery id: self badgeId) load html: [ :r | self renderValidationBadgeOn: r ]
]

{ #category : #javascript }
OOAbstractQuestionEditionComponent >> refreshDoing: aBlock on: html [
	^ (html jQuery id: self panelId) load
		html: [ :r | 
			aBlock value.
			self renderPanelContentOn: r ];
		onComplete: self initScript
]

{ #category : #javascript }
OOAbstractQuestionEditionComponent >> refreshOn: html [
	^ self refreshDoing: [  ] on: html
]

{ #category : #action }
OOAbstractQuestionEditionComponent >> reinitializeQuestionFrom: aClass [
	| newQuestion |
	self mcq removeQuestion: self question.
	self mcq
		addQuestion: (newQuestion := aClass new index: self question index).
	self question: newQuestion.
	aClass minimumNumberOfAnswers
		timesRepeat: [ self question addEmptyAnswer ].
	self question answers
		detect: [ :a | a index = 1 ]
		ifFound: [ :a | a beRight ]
]

{ #category : #rendering }
OOAbstractQuestionEditionComponent >> renderAddAnswerButtonOn: html [
	self shouldRenderAddAnswerButton
		ifTrue: [ ^ self ].
	html anchor
		style: 'cursor: pointer;';
		onClick:
			((html jQuery id: self panelId) load
				html: [ :r | 
					self question addEmptyAnswer.
					self renderPanelContentOn: html ];
				onComplete: self initScript);
		with: [ (html tag: 'i') class: 'fa fa-plus-circle'.
			html space.
			html text: 'Ajouter une réponse' ]
]

{ #category : #rendering }
OOAbstractQuestionEditionComponent >> renderAnswersOn: html [
	self question class isAbstract
		ifTrue: [ ^ self ].
	self question renderAnswersFrom: self on: html.
	html tbsFormGroup: [ self renderAddAnswerButtonOn: html ].
	html
		tbsFormGroup: [ self question hasCorrection
				ifFalse: [ html space.
					html tbsButton
						beInfo;
						bePush;
						onClick: (self refreshAnswersDoing: [ self question correction: 'Explication' ] on: html);
						with: 'Ajouter une correction' ] ].
	self renderExplanationInputOn: html
]

{ #category : #rendering }
OOAbstractQuestionEditionComponent >> renderConcreteFormOn: html [
	self question class isAbstract
		ifTrue: [ ^ self ].
	html
		tbsFormGroup: [ | id label |
			label := 'Intitulé de la question ' , self question index asString.
			html label
				for: (id := html nextId);
				tbsScreenReaderOnly;
				with: label.
			html textInput
				tbsFormControl;
				id: id;
				required;
				placeholder: label;
				callback: [ :title | self question description: title ];
				onChange:
					(html jQuery ajax
						serializeThis;
						onSuccess: (self refreshBadgeOn: html));
				value: self question description ].
	html div
		id: self answersId;
		with: [ self renderAnswersOn: html ]
]

{ #category : #rendering }
OOAbstractQuestionEditionComponent >> renderContentOn: html [
	html tbsArticlePanel
		id: self panelId;
		beDefault;
		with: [ self renderPanelContentOn: html ]
]

{ #category : #rendering }
OOAbstractQuestionEditionComponent >> renderErrorOn: html [
	self owner hasBeenValidated
		ifFalse: [ ^ self ].
	[ self question class isAbstract
		ifTrue: [ OOInvalidQuestion new
				reason: 'Veuillez choisir le type de question.';
				signal ]
		ifFalse: [ self question validate ] ]
		on: OOInvalidQuestion
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'La question ' , self question index asString , ' n''est pas valide ! '.
					html text: e reason ] ]
]

{ #category : #rendering }
OOAbstractQuestionEditionComponent >> renderExplanationInputOn: html [
	self question hasCorrection
		ifFalse: [ ^ self ].
	html
		tbsFormGroup: [ html
				tbsInputGroup: [ | label |
					label := 'Explication de la réponse'.
					html label
						for: html nextId;
						tbsScreenReaderOnly;
						with: label.
					html textArea
						tbsFormControl;
						id: html lastId;
						placeholder: label;
						callback: [ :explanation | self question correction: explanation ];
						value: self question correction;
						rows: 3.
					html
						tbsInputGroupButton: [ html tbsButton
								bePush;
								beDanger;
								beLink;
								onClick: (self refreshAnswersDoing: [ self question removeCorrection ] on: html);
								with: [ (html tag: #i)
										class: 'fa fa-times';
										ariaHidden: true ] ] ] ]
]

{ #category : #rendering }
OOAbstractQuestionEditionComponent >> renderFooterOn: html [
	self isLast
		ifTrue: [ ^ self ].
	html
		tbsArticlePanelFooter: [ html tbsAnchor
				role: #button;
				url: '#question' , (self index + 1) greaseString;
				attributeAt: #'data-toggle' put: #collapse;
				attributeAt: #'data-parent' put: #'#mcqCreation';
				bePrimary;
				onClick:
					(html jQuery ajax
						callback: [ self desactivate.
							self owner activateQuestionAt: self index + 1 ];
						onComplete: ('$("html, body").scrollTop($("#' , self panelId , '").offset().top)') js);
				with: 'Suivant' ]
]

{ #category : #rendering }
OOAbstractQuestionEditionComponent >> renderFormContentOn: html [
	html section
		class: #'panel-body';
		with: [ html
				tbsRow: [ html
						tbsColumn
						extraSmallSize: 12;
						with: [ html
								tbsFormGroup: [ | group |
									group := html radioGroup.
									self questionKinds
										do: [ :class | 
											html div
												class: #radio;
												with: [ group radioButton
														id: html nextId;
														selected: self question class = class;
														callback: [ self question class = class
																ifFalse: [ self reinitializeQuestionFrom: class ] ];
														onChange:
															(html jQuery ajax
																serializeThis;
																onSuccess: (self refreshOn: html)).
													html label
														tbsTooltip: class description;
														for: html lastId;
														with: class label ] ] ].
							self renderConcreteFormOn: html ] ].
			self renderFooterOn: html ]
]

{ #category : #rendering }
OOAbstractQuestionEditionComponent >> renderHeaderOn: html [
	html tbsArticlePanelHeader
		parent: #'#mcqCreation';
		toggle: #collapse;
		target: self id;
		onClick: (html jQuery ajax callback: [ self headerClickAction ]);
		with: [ html tbsPanelTitle
				level2;
				with: [ html text: 'Question ' , self index asString.
					html div
						tbsPullRight;
						class: #'accordion-status';
						id: self badgeId;
						with: [ self renderValidationBadgeOn: html ] ] ]
]

{ #category : #rendering }
OOAbstractQuestionEditionComponent >> renderPanelContentOn: html [
	self renderHeaderOn: html.
	html div
		id: self id;
		class: #'panel-collapse';
		class: #collapse;
		class: #in if: self isActive;
		role: #tabpanel;
		with: [ self renderErrorOn: html.
			self renderFormContentOn: html ]
]

{ #category : #rendering }
OOAbstractQuestionEditionComponent >> renderValidationBadgeOn: html [
	html div
		class: 'text-success' if: self isValid;
		class: 'text-danger' if: self isValid not;
		with: [ (html tag: 'i')
				class: 'fa';
				class: 'fa-lg';
				class:
					(self isValid
						ifTrue: [ 'fa-check-circle-o' ]
						ifFalse: [ 'fa-times-circle-o' ]) ]
]

{ #category : #testing }
OOAbstractQuestionEditionComponent >> shouldRenderAddAnswerButton [
	^ self question class isAbstract
		or: [ self question class maximumNumberOfAnswers
				= self question answers size ]
]
