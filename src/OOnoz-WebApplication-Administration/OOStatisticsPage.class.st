Class {
	#name : #OOStatisticsPage,
	#superclass : #OOPage,
	#instVars : [
		'charts',
		'selectedChart'
	],
	#category : 'OOnoz-WebApplication-Administration-Pages'
}

{ #category : #accessing }
OOStatisticsPage >> breadcrumpLabel [
	^ #Statistiques
]

{ #category : #accessing }
OOStatisticsPage >> charts [
	^ charts
]

{ #category : #accessing }
OOStatisticsPage >> charts: anObject [
	charts := anObject
]

{ #category : #hooks }
OOStatisticsPage >> children [
	^ Array with: self selectedChart
]

{ #category : #accessing }
OOStatisticsPage >> description [
	^ ''
]

{ #category : #initialization }
OOStatisticsPage >> initialize [
	super initialize.
	self charts: (OOAbstractStatChartComponent allSubclasses collect: [ :c | c owner: self ])
]

{ #category : #accessing }
OOStatisticsPage >> moduleName [
	^ #stats
]

{ #category : #rendering }
OOStatisticsPage >> renderComponentOn: html [
	html tbsContainer: [ self selectedChart ifNil: [ self renderPossibilitiesOn: html ] ifNotNil: [ :c | html render: c ] ]
]

{ #category : #rendering }
OOStatisticsPage >> renderPossibilitiesOn: html [
	html tbsRow
		class: 'possibilities';
		with: [ self charts
				do: [ :class | 
					html
						tbsColumn: [ html anchor
								callback: [ self selectedChart: class ];
								with: [ html figure
										class: 'thumbnail';
										class: 'grid-item';
										with: [ html image url: self configuration resourcesURL , '/images/' , class image.
											html
												figureCaption: [ html heading
														level3;
														with: class title.
													html paragraph: class description ] ] ] ]
						mediumSize: 4 ] ]
]

{ #category : #accessing }
OOStatisticsPage >> selectedChart [
	^ selectedChart
]

{ #category : #accessing }
OOStatisticsPage >> selectedChart: anObject [
	selectedChart := anObject
]

{ #category : #accessing }
OOStatisticsPage >> title [
	^ ''	"#Statistiques"
]
