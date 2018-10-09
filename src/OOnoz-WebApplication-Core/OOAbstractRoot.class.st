Class {
	#name : #OOAbstractRoot,
	#superclass : #OOComponent,
	#instVars : [
		'header',
		'component',
		'componentsInstances'
	],
	#category : 'OOnoz-WebApplication-Core'
}

{ #category : #'class initialization' }
OOAbstractRoot class >> restoreSeasideDiv [
	<script>
	WAHtmlCanvas
		compile:
			'div
	"Defines a section in a document."

	^ self tag: ''div'''
		classified: 'tags-styles'
		withStamp: 'Jenkins 12/21/2016 11:14'
		notifying: nil
]

{ #category : #'class initialization' }
OOAbstractRoot class >> sessionDuration [
	"60 minutes"

	^ 3600
]

{ #category : #'class initialization' }
OOAbstractRoot class >> useExceptionCatcherDiv [
	<script>
	WAHtmlCanvas
		compile:
			'div
	"Defines a section in a document."

	^ self brush: SYNDivExceptionCatcherTag new'
		classified: 'tags-styles'
		withStamp: 'Jenkins 12/21/2016 11:14'
		notifying: nil
]

{ #category : #rendering }
OOAbstractRoot >> addEndsScriptsOn: html [
	html script url: 'https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'.
	html script
		url: 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js';
		attributeAt: 'integrity' put: 'sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa';
		attributeAt: 'crossorigin' put: 'anonymous'.
	html script
		url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.2.0/bootstrap-slider.min.js';
		attributeAt: 'integrity' put: 'sha256-jkZPPiQWvKWEpTyXospDAsDOUMnqYwPObBRISK6FNHM=';
		attributeAt: 'crossorigin' put: 'anonymous'.
	html script url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.min.js'.
	html script url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/locale/bootstrap-table-fr-FR.min.js'.
	html script url: self configuration resourcesURL , '/Dependencies/bootstrap-datepicker/js/bootstrap-datepicker.min.js'.
	html script url: self configuration resourcesURL , '/Dependencies/bootstrap-datepicker/locales/bootstrap-datepicker.fr.min.js'.
	html script url: self configuration resourcesURL , '/Dependencies/rate/bootstrap-rating.min.js'.
	html script url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.0/js/bootstrap-select.min.js'.
	html script url: 'https://cdn.jsdelivr.net/jquery.autosize/3.0.17/autosize.min.js'.
	html script url: self configuration resourcesURL , '/Maquettes/script/partial/_nav_buttons.js'.
	html script url: self configuration resourcesURL , '/Maquettes/script/partial/_navbar.js'.
	html script url: self configuration resourcesURL , '/Maquettes/script/main.js'.
	html document addLoadScript: 'autosize($(''textarea''));$(''[data-toggle="tooltip"]'').tooltip();' js.
	html script url: self configuration resourcesURL , '/Maquettes/script/vendor/salvattore.min.js'
]

{ #category : #hooks }
OOAbstractRoot >> children [
	^ {self header.
	self component}
]

{ #category : #accessing }
OOAbstractRoot >> component [
	^ component
]

{ #category : #accessing }
OOAbstractRoot >> component: anObject [
	component := anObject
]

{ #category : #accessing }
OOAbstractRoot >> componentsInstances [
	^ componentsInstances
]

{ #category : #accessing }
OOAbstractRoot >> componentsInstances: anObject [
	componentsInstances := anObject
]

{ #category : #components }
OOAbstractRoot >> defaultHeader [
	^ self subclassResponsibility
]

{ #category : #initialization }
OOAbstractRoot >> displayDefaultScreen [
	self subclassResponsibility
]

{ #category : #accessing }
OOAbstractRoot >> header [
	^ header
]

{ #category : #accessing }
OOAbstractRoot >> header: anObject [
	header := anObject
]

{ #category : #initialization }
OOAbstractRoot >> initScreens [
	self componentsInstances: Dictionary new.
	self displayDefaultScreen
]

{ #category : #initialization }
OOAbstractRoot >> initialize [
	super initialize.
	self session rootComponent: self.
	self initScreens.
	self header: self defaultHeader
]

{ #category : #initialization }
OOAbstractRoot >> instanceOf: aComponentClass [
	^ self componentsInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ]
]

{ #category : #rendering }
OOAbstractRoot >> renderContentOn: html [
	html render: self header.
	(html tag: #main)
		with: [ html render: self component.
			self renderEmptyGenericDialogOn: html ].
	html anchor
		url: '#';
		class: 'btn btn-primary btn-top';
		id: 'goToTop';
		role: 'button';
		title: 'Revenir en haut de la page';
		attributeAt: 'data-toggle' put: 'tooltip';
		attributeAt: 'data-placement' put: 'left';
		with: [ (html tag: 'i')
				class: 'fa fa-chevron-up';
				ariaHidden: 'true' ].
	self addEndsScriptsOn: html
]

{ #category : #rendering }
OOAbstractRoot >> renderEmptyGenericDialogOn: html [
	html tbsModal
		beFade;
		tabIndex: -1;
		role: 'dialog';
		id: self rootDialogOpenId;
		with: [ html tbsModalDialog
				role: #document;
				with: [ html tbsModalContent id: self rootDialogId ] ]
]

{ #category : #rendering }
OOAbstractRoot >> rootDialogOpenId [
	^ #'root-dialog__open'
]

{ #category : #initialization }
OOAbstractRoot >> setInstanceOf: aComponentClass [
	^ self component: (self instanceOf: aComponentClass)
]

{ #category : #hooks }
OOAbstractRoot >> states [
	^ Array with: self
]

{ #category : #updating }
OOAbstractRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot meta
		responseHeaderName: 'X-UA-Compatible';
		content: 'IE=edge'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	anHtmlRoot title: 'OOnoz - Des milliers de questionnaires'.
	self updateTabIconRoot: anHtmlRoot.
	anHtmlRoot stylesheet
		url: 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';
		attributeAt: 'integrity' put: 'sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u';
		attributeAt: 'crossorigin' put: 'anonymous'.
	anHtmlRoot stylesheet
		url: 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css';
		attributeAt: 'integrity' put: 'sha256-AIodEDkC8V/bHBkfyxzolUMw57jeQ9CauwhVW6YJ9CA=';
		attributeAt: 'crossorigin' put: 'anonymous'.
	anHtmlRoot stylesheet url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.min.css'.
	anHtmlRoot stylesheet
		url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.2.0/css/bootstrap-slider.min.css';
		attributeAt: 'integrity' put: 'sha256-H6C3l25ZwMalTkgPDWuhR+1AaD6bKtFU4gTKJprFIt8=';
		attributeAt: 'crossorigin' put: 'anonymous'.
	anHtmlRoot stylesheet
		url: self configuration resourcesURL , '/Dependencies/bootstrap-datepicker/css/bootstrap-datepicker3.standalone.min.css'.
	anHtmlRoot stylesheet url: self configuration resourcesURL , '/Dependencies/rate/bootstrap-rating.css'.
	anHtmlRoot stylesheet url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.0/css/bootstrap-select.min.css'.
	anHtmlRoot stylesheet url: self configuration resourcesURL , '/Maquettes/css/main.css'.
	anHtmlRoot stylesheet url: self configuration resourcesURL , '/Maquettes/css/toClean.css'.
	anHtmlRoot script url: self configuration resourcesURL , '/Maquettes/script/additions.js'
]

{ #category : #updating }
OOAbstractRoot >> updateTabIconRoot: anHtmlRoot [
	anHtmlRoot link
		relationship: 'apple-touch-icon';
		attributeAt: 'sizes' put: '180x180';
		url: self configuration resourcesURL , '/Maquettes/images/favicon/apple-touch-icon-180x180.png'.
	anHtmlRoot link
		relationship: 'icon';
		type: 'image/png';
		url: self configuration resourcesURL , '/Maquettes/images/favicon/favicon-32x32.png';
		attributeAt: 'sizes' put: '32x32'.
	anHtmlRoot link
		relationship: 'icon';
		type: 'image/png';
		url: self configuration resourcesURL , '/Maquettes/images/favicon/favicon-16x16.png';
		attributeAt: 'sizes' put: '16x16'.
	anHtmlRoot link
		relationship: 'manifest';
		url: self configuration resourcesURL , '/Maquettes/images/favicon/manifest.json'.
	anHtmlRoot link
		relationship: 'mask-icon';
		url: self configuration resourcesURL , '/Maquettes/images/favicon/safari-pinned-tab.svg';
		attributeAt: 'color' put: '#2196f3'.
	anHtmlRoot meta
		name: 'msapplication-TileColor';
		content: '#ff0000'.
	anHtmlRoot meta
		name: 'msapplication-TileImage';
		content: self configuration resourcesURL , '/Maquettes/images/favicon/mstile-144x144.png'.
	anHtmlRoot meta
		name: 'theme-color';
		content: '#ffffff'
]
