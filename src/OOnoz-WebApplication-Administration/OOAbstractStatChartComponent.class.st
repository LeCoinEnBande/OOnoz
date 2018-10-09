Class {
	#name : #OOAbstractStatChartComponent,
	#superclass : #OOComponent,
	#instVars : [
		'owner',
		'mcqFilter',
		'mcqInputCache',
		'valuesCache'
	],
	#category : 'OOnoz-WebApplication-Administration-Pages'
}

{ #category : #testing }
OOAbstractStatChartComponent class >> isAbstract [
	^ self = OOAbstractStatChartComponent 
]

{ #category : #'instance creation' }
OOAbstractStatChartComponent class >> owner: aComponent [
	^ self new
		owner: aComponent;
		yourself
]

{ #category : #accessing }
OOAbstractStatChartComponent >> chartTitle [
	^ self subclassResponsibility 
]

{ #category : #accessing }
OOAbstractStatChartComponent >> description [
	^ self subclassResponsibility
]

{ #category : #accessing }
OOAbstractStatChartComponent >> image [
	^ self subclassResponsibility 
]

{ #category : #initialization }
OOAbstractStatChartComponent >> initialize [
	super initialize.
	self
		mcqFilter:
			(OOMCQFilter
				refreshScript: [ :html | 
					(html jQuery: #'chart-stat') load
						html: [ :r | 
							self mcqInputCache: nil.
							self renderChartOn: r.
							self valuesCache: nil ] ])
]

{ #category : #accessing }
OOAbstractStatChartComponent >> mcqFilter [
	^ mcqFilter
]

{ #category : #accessing }
OOAbstractStatChartComponent >> mcqFilter: aFilter [ 
	mcqFilter := aFilter
]

{ #category : #accessing }
OOAbstractStatChartComponent >> mcqInput [
	^ self mcqInputCache
		ifNil: [ self mcqInputCache: (self mcqFilter filter: OOAbstractMCQ selectAll).
			self mcqInputCache ]
]

{ #category : #accessing }
OOAbstractStatChartComponent >> mcqInputCache [
	^ mcqInputCache
]

{ #category : #accessing }
OOAbstractStatChartComponent >> mcqInputCache: anObject [ 
	mcqInputCache := anObject
]

{ #category : #accessing }
OOAbstractStatChartComponent >> owner [
	^ owner
]

{ #category : #accessing }
OOAbstractStatChartComponent >> owner: aPage [ 
	owner := aPage
]

{ #category : #rendering }
OOAbstractStatChartComponent >> renderButtonsOn: html [
	html tbsAnchor
		beDanger;
		callback: [ self owner selectedChart: nil ];
		with: 'Retour'
]

{ #category : #rendering }
OOAbstractStatChartComponent >> renderChartOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
OOAbstractStatChartComponent >> renderContentOn: html [
	self mcqInputCache: nil.
	html
		tbsRow: [ html heading
				level3;
				with: [ html text: self chartTitle.
					5 timesRepeat: [ html space ].
					self renderButtonsOn: html ] ].
	html
		tbsRow: [ html
				tbsColumn: [ html form
						id: #'chart-all';
						with: [ self renderFormContentOn: html ] ]
				mediumSize: 2.
			html tbsColumn
				id: #'chart-stat';
				mediumSize: 10;
				with: [ self renderChartOn: html.
					self valuesCache: nil ] ].
	html document
		addLoadScript:
			'$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)});$(".material-switch").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)})'
				js
]

{ #category : #rendering }
OOAbstractStatChartComponent >> renderEmptyScreenOn: html [
	html tbsAlert
		style: 'margin-top: 20px;';
		beDanger;
		with: [ html strong: 'Aucun résultat. '.
			html text: 'Veuillez réduire la sévérité de vos filtres. ' ]
]

{ #category : #rendering }
OOAbstractStatChartComponent >> renderFormContentOn: html [
	html heading
		level3;
		with: 'Filtres'.
	html hr.
	html render: self mcqFilter.
	self renderHookOn: html.
	html tbsAnchor
		beWarning;
		callback: [ self mcqInputCache: nil.
			self resetFilters ];
		with: 'Réinitialiser'
]

{ #category : #rendering }
OOAbstractStatChartComponent >> renderHookOn: html [
]

{ #category : #initialization }
OOAbstractStatChartComponent >> resetFilters [
	self mcqFilter resetFilters
]

{ #category : #accessing }
OOAbstractStatChartComponent >> valuesCache [
	^ valuesCache
]

{ #category : #accessing }
OOAbstractStatChartComponent >> valuesCache: anObject [
	valuesCache := anObject
]
