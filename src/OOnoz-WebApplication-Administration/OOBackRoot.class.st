Class {
	#name : #OOBackRoot,
	#superclass : #OOAbstractRoot,
	#instVars : [
		'loginComp'
	],
	#category : 'OOnoz-WebApplication-Administration-Core'
}

{ #category : #initialization }
OOBackRoot class >> initialize [
	<oonozApplication>
	| app |
	app := WAAdmin register: self asApplicationAt: 'OOnozAdministration'.
	app preferenceAt: #sessionClass put: OOSession.
	app configuration at: #maximumAbsoluteAge put: 0.
	app configuration at: #maximumRelativeAge put: self sessionDuration
]

{ #category : #components }
OOBackRoot >> defaultHeader [
	^ OOBackHeader new
]

{ #category : #initialization }
OOBackRoot >> displayDefaultScreen [
	self setInstanceOf: OOStatisticsPage
]

{ #category : #initialization }
OOBackRoot >> initialize [
	super initialize.
	loginComp := OOBackLoginComponent new
]

{ #category : #accessing }
OOBackRoot >> loginComp [
	^ loginComp
]

{ #category : #rendering }
OOBackRoot >> renderBackLoginPageOn: html [
	html div
		style: 'min-height: 100vh; background-color: #00695C;';
		with: [ html
				tbsContainer: [ html
						tbsRow: [ html tbsColumn
								mediumSize: 6;
								mediumOffset: 3;
								style: 'background-color: #FFF;margin-top: 100px; padding: 30px; border-radius: 3px;';
								with: [ html render: self loginComp ] ] ] ]
]

{ #category : #rendering }
OOBackRoot >> renderContentOn: html [
	self isLogged
		ifTrue: [ super renderContentOn: html ]
		ifFalse: [ self renderBackLoginPageOn: html ]
]

{ #category : #updating }
OOBackRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: self configuration resourcesURL , '/Dependencies/ChartJsLibrary/ChartJs.css'.
	anHtmlRoot script url: self configuration resourcesURL , '/Dependencies/ChartJsLibrary/BarPlotChart.js'.
	anHtmlRoot script url: self configuration resourcesURL , '/Dependencies/ChartJsLibrary/Chartmin.js'.
	anHtmlRoot script url: self configuration resourcesURL , '/Dependencies/ChartJsLibrary/extChart.js'.
	anHtmlRoot script url: self configuration resourcesURL , '/Dependencies/ChartJsLibrary/post.js'.
	self isLogged
		ifFalse: [ anHtmlRoot bodyAttributes addClass: 'no-padding' ]
]
