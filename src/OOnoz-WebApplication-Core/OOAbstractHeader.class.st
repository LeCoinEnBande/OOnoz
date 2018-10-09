Class {
	#name : #OOAbstractHeader,
	#superclass : #OOComponent,
	#category : 'OOnoz-WebApplication-Core'
}

{ #category : #testing }
OOAbstractHeader >> isTheActiveClass: aComponentClass [
	^ aComponentClass = self rootComponent component class
]

{ #category : #action }
OOAbstractHeader >> moveToPage: aClass [
	self rootComponent setInstanceOf: aClass
]

{ #category : #accessing }
OOAbstractHeader >> navContentMap [
	^ self subclassResponsibility
]

{ #category : #rendering }
OOAbstractHeader >> renderContentOn: html [
	html
		header: [ html tbsNavbar
				beDefault;
				beFixedTop;
				with: [ html tbsContainer: [ self renderNavbarContentOn: html ] ] ]
]

{ #category : #rendering }
OOAbstractHeader >> renderLogoOn: html [
	self flag: #todo.	"use Logo"
	html tbsNavbarBrand
		url: '#';
		with: #OOnoz	"[ html image
				altText: 'OOnoz';
				url: self resourcesURL , '/images/logo_min.png' ]"
]

{ #category : #rendering }
OOAbstractHeader >> renderMenuOn: html [
	self navContentMap keysAndValuesDo: [ :title :component | self renderNavItemNamed: title navigatingTo: component on: html ]
]

{ #category : #rendering }
OOAbstractHeader >> renderNavItemNamed: aString navigatingTo: aComponentClass on: html [
	html tbsNavItem
		beActiveIf: (self isTheActiveClass: aComponentClass);
		with: [ html anchor
				callback: [ self moveToPage: aComponentClass ];
				with:
					((aString = 'Questionnaires' and: [ self currentUser isAdmin ])
						ifTrue: [ [ | count |
							count := OOAbstractMCQ count: [ :m | m state = #undefined ].
							html text: aString.
							html space.
							count = 0
								ifFalse: [ html tbsBadge: count asString ] ] ]
						ifFalse: [ aString ]) ]
]

{ #category : #rendering }
OOAbstractHeader >> renderNavToogleFor: anId on: html [
	html tbsNavbarToggle
		target: '#', anId;
		ariaExpanded: false;
		with: 'Enclencher la navigation'
]

{ #category : #rendering }
OOAbstractHeader >> renderNavbarContentOn: html [
	| id |
	id := #mainNavbar.
	html
		tbsNavbarHeader: [ self renderNavToogleFor: id on: html.
			self renderLogoOn: html ].
	html tbsNavbarCollapse
		id: id;
		with: [ html unorderedList
				class: #'nav navbar-nav navbar-right';
				with: [ self renderMenuOn: html ] ]
]
