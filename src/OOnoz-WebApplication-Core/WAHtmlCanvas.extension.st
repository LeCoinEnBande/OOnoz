Extension { #name : #WAHtmlCanvas }

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> hr [
	^ self tag: 'hr'
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsAlertCloseSpan [
	^ self span
		attributeAt: #'aria-hidden' put: #true;
		with: [ self html: '&times;' ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsAnchor [
	"Defines an Twitter Bootstrap anchor."

	^ self brush: TBSAnchorTag new

]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsAnchor: aBlock [
	"Defines an Twitter Bootstrap anchor."

	^ self tbsAnchor
		with: aBlock;
		yourself
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsArticlePanel [
	^ self brush: TBSArticlePanelTag new
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsArticlePanel: aBlock [
	^ self tbsArticlePanel
		with: aBlock;
		yourself
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsArticlePanelFooter: aBlock [
	^ self footer
		class: #'panel-footer';
		class: #clearfix;
		with: [ self div
				tbsPullRight;
				with: aBlock ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsArticlePanelHeader [
	^ self brush: TBSArticlePanelHeaderTag new
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsArticlePanelHeader: aBlock [
	^ self tbsArticlePanelHeader
		with: aBlock;
		yourself
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsColMs: anInterger mo: anotherInteger with: aBlock [
	^ self tbsColumn
		mediumSize: anInterger;
		mediumOffset: anotherInteger;
		with: aBlock
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsDismissAlertButton [
	^ self tbsButton
		dataDismiss: #alert;
		beClose;
		bePush;
		ariaLabel: #Close;
		with: [ self tbsAlertCloseSpan ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsHelpBlockId: anId with: aBlock [
	^ self span
		id: anId;
		with: aBlock
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsNavbarCollapse [
	^ self div
		class: #'navbar-collapse';
		class: #collapse;
		yourself
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsNavbarCollapse: aBlock [
	^ self tbsNavbarCollapse
		with: aBlock;
		yourself
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAHtmlCanvas >> tbsPanelGroupId: anId with: aBlock [
	^ self section
		class: #'panel-group';
		id: anId;
		role: #tablist;
		ariaMultiselectable: true;
		with: aBlock
]
