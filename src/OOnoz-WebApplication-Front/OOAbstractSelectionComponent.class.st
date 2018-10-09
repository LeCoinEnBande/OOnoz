Class {
	#name : #OOAbstractSelectionComponent,
	#superclass : #OOComponent,
	#instVars : [
		'filter',
		'entitiesCached',
		'page'
	],
	#category : 'OOnoz-WebApplication-Front-Components'
}

{ #category : #'instance creation' }
OOAbstractSelectionComponent class >> page: aComponent [
	^ self new
		page: aComponent;
		yourself
]

{ #category : #accessing }
OOAbstractSelectionComponent >> computeEntitiesToShow [
	^ self inputEntities
		select:
			[ :entity | OOPseudoRegexFilter isMatching: entity title with: self filter ]
]

{ #category : #rendering }
OOAbstractSelectionComponent >> defineScrollCallbackOn: aDiv [
	^ aDiv
		storeCallback:
			(WAValueCallback
				on: [ :intervalRequest | 
					self requestContext
						respond: [ :response | 
							| interval |
							interval := intervalRequest substrings: ':'.
							self
								printHtmlForElementsFrom: interval first asNumber
								to: interval last asNumber
								context: aDiv canvas context
								on:
									(response
										doNotCache;
										contentType: WAMimeType textHtml;
										stream) ] ])
]

{ #category : #accessing }
OOAbstractSelectionComponent >> entitiesCached [
	^ entitiesCached ifNil: [ entitiesCached := self computeEntitiesToShow ]
]

{ #category : #accessing }
OOAbstractSelectionComponent >> entitiesCached: aCollection [
	entitiesCached := aCollection
]

{ #category : #'as yet unclassified' }
OOAbstractSelectionComponent >> entityName [
	^ self subclassResponsibility 
]

{ #category : #accessing }
OOAbstractSelectionComponent >> filter [
	^ filter ifNil: [ '' ]
]

{ #category : #accessing }
OOAbstractSelectionComponent >> filter: aString [
	filter := aString.
	self resetCache
]

{ #category : #'as yet unclassified' }
OOAbstractSelectionComponent >> inputEntities [
	^ self subclassResponsibility
]

{ #category : #accessing }
OOAbstractSelectionComponent >> page [
	^ page
]

{ #category : #accessing }
OOAbstractSelectionComponent >> page: aComponent [
	page := aComponent
]

{ #category : #rendering }
OOAbstractSelectionComponent >> printHtmlForElementsFrom: start to: end context: aContext on: aStream [
	| document |
	document := (WAHtmlDocument on: aStream codec: GRNullCodec new)
		scriptGenerator: WADefaultScriptGenerator new;
		yourself.
	aContext document: document.
	(WAHtmlCanvas context: aContext)
		render: [ :htmlDyn | 
			(start < self entitiesCached size and: [ end >= 1 ])
				ifTrue: [ self entitiesCached
						from: (start max: 1)
						to: (end min: self entitiesCached size)
						do: [ :anElement | anElement renderForSearchOf: self on: htmlDyn ] ] ];
		flush.
	document scriptGenerator closeOn: document
]

{ #category : #'as yet unclassified' }
OOAbstractSelectionComponent >> randomScope [
	^ self subclassResponsibility 
]

{ #category : #rendering }
OOAbstractSelectionComponent >> renderContentOn: html [
	self resetCache.
	html
		tbsContainer: [ self
				renderSteperOn: html;
				renderSearchFieldOn: html.
			self renderSearchOptionsOn: html.
			self renderEntitiesCardsOn: html.
			self entitiesCached
				ifEmpty: [ html tbsAlert
						beWarning;
						with: 'Désolé mais nous n''avons pas encore de QCMs satisfaisant votre recherche.' ] ].
	html document addLoadScript: '$(window).scrollTop(0)' js
]

{ #category : #rendering }
OOAbstractSelectionComponent >> renderEntitiesCardsOn: html [
	| scrollCb container |
	(container := html div)
		id: 'queryResult';
		attributeAt: 'data-columns' put: ''.
	scrollCb := self defineScrollCallbackOn: container.
	self setDataForCallBack: container html: html scrollCb: scrollCb.
	container with: [ self renderQueryResultContentOn: html ]
]

{ #category : #rendering }
OOAbstractSelectionComponent >> renderOptionsHookOn: html [
	"Here I do nothing. I am a hook for my subclasses."

	
]

{ #category : #rendering }
OOAbstractSelectionComponent >> renderProgressBarFor: currentStep with: label on: html [
	html tbsColumn
		extraSmallSize: 4;
		class: 'bs-wizard-step';
		class: 'complete' if: currentStep < self stepNumber;
		class: 'active' if: currentStep = self stepNumber;
		with: [ | anchor |
			html div
				beCentered;
				class: 'bs-wizard-stepnum';
				with: currentStep asString.
			html div
				class: 'progress';
				with: [ html div class: 'progress-bar' ].
			anchor := html anchor
				class: 'bs-wizard-dot';
				yourself.
			currentStep < self stepNumber
				ifTrue: [ anchor callback: [ self answer: self stepNumber - currentStep ] ].
			html div
				beCentered;
				class: 'bs-wizard-info';
				with: label ]
]

{ #category : #rendering }
OOAbstractSelectionComponent >> renderQueryResultContentOn: html [
	(self entitiesCached first: (15 min: self entitiesCached size)) do: [ :entity | entity renderForSearchOf: self on: html ]
]

{ #category : #rendering }
OOAbstractSelectionComponent >> renderSearchFieldOn: html [
	html
		tbsRow: [ html
				tbsColMs: 10
				mo: 1
				with: [ html
						tbsFormGroup: [ | label |
							html label
								for: html nextId;
								tbsScreenReaderOnly;
								with: (label := self searchFieldLabel).
							html textInput
								type: 'search';
								placeholder: label;
								id: html lastId;
								onKeyUp:
									(html jQuery ajax
										callback: [ :filt | self filter: filt ] value: (JSStream on: 'event.target.value');
										onComplete:
											((html jQuery id: 'queryResult') load
												html: [ :r | self renderQueryResultContentOn: r ];
												onComplete: 'salvattore.registerGrid(document.getElementById("queryResult"))' js));
								tbsFormControl;
								value: self filter ] ] ].
						  
]

{ #category : #rendering }
OOAbstractSelectionComponent >> renderSearchOptionsOn: html [
	html
		tbsRow: [ html
				tbsColMs: 10
				mo: 1
				with: [ html
						tbsWell: [ html div
								tbsPullRight;
								with: [ html tbsGlyphIcon
										iconChevronUp;
										style: 'cursor: pointer;';
										onClick:
											'if(this.classList.contains("glyphicon-chevron-up")){this.classList.add("glyphicon-chevron-down");this.classList.remove("glyphicon-chevron-up");}else{this.classList.add("glyphicon-chevron-up");this.classList.remove("glyphicon-chevron-down");}$("#mcq-options").fadeToggle(1000);' js ].
							html heading
								level5;
								with: 'Options de recherche'.
							html div
								style: 'display:flex;justify-content: space-between;align-items: center;flex-wrap: wrap;';
								id: #'mcq-options';
								with: [ self randomScope ifNotEmpty: [ :scope | html div: [ html render: (OORandomButton scope: scope page: self page) ] ].
									self renderOptionsHookOn: html ] ] ] ]
]

{ #category : #rendering }
OOAbstractSelectionComponent >> renderSteperOn: html [
	html tbsRow
		class: 'bs-wizard';
		with: [ (OrderedDictionary
				with: 1 -> 'Choix du thème'
				with: 2 -> 'Choix du sous-thème'
				with: 3 -> 'Choix du questionnaire')
				keysAndValuesDo:
					[ :currentStep :label | self renderProgressBarFor: currentStep with: label on: html ] ]
]

{ #category : #accessing }
OOAbstractSelectionComponent >> resetCache [
	self entitiesCached: nil
]

{ #category : #rendering }
OOAbstractSelectionComponent >> searchFieldLabel [
	^ String
		streamContents: [ :s | 
			s
				<< 'Rechercher parmis les ';
				<< self inputEntities size;
				<< ' ';
				<< self entityName pluralize ]
]

{ #category : #enumerating }
OOAbstractSelectionComponent >> select: anEntity [
	self subclassResponsibility
]

{ #category : #rendering }
OOAbstractSelectionComponent >> setDataForCallBack: div html: html scrollCb: scrollCb [
	div
		attributeAt: 'data-url' asSymbol put: html actionUrl asString;
		attributeAt: 'data-cbId' asSymbol put: scrollCb asString;
		attributeAt: 'data-listMaxSize' asSymbol put: self inputEntities size;
		attributeAt: 'data-lastIndexAsked' asSymbol put: '1';
		attributeAt: 'data-loadingstep' put: '15'
]

{ #category : #'as yet unclassified' }
OOAbstractSelectionComponent >> stepNumber [
	^ self subclassResponsibility
]
