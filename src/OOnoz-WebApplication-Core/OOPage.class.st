Class {
	#name : #OOPage,
	#superclass : #OOComponent,
	#category : 'OOnoz-WebApplication-Core'
}

{ #category : #accessing }
OOPage >> breadcrumpLabel [
	^ self subclassResponsibility
]

{ #category : #hooks }
OOPage >> breadcrumpSubLabel [
	^ nil
]

{ #category : #accessing }
OOPage >> description [
	^ self subclassResponsibility
]

{ #category : #hooks }
OOPage >> modalId [
	^ nil
]

{ #category : #accessing }
OOPage >> moduleName [
	"I should return a css class to customize the image."

	^ self subclassResponsibility
]

{ #category : #rendering }
OOPage >> renderBreadcrumbFirstItemOn: html [
	self modalId
		ifNil: [ html text: self breadcrumpLabel ]
		ifNotNil: [ html anchor
				url: '#';
				dataToggle: 'modal';
				dataTarget: '#' , self modalId;
				with: self breadcrumpLabel ]
]

{ #category : #rendering }
OOPage >> renderBreadcrumbOn: html [
	html aside
		class: #indicator;
		class: self moduleName , '-indicator-1';
		with: [ html
				tbsContainer: [ html
						tbsBreadcrumb: [ html tbsBreadcrumbSection
								beActiveIf: self breadcrumpSubLabel isNil;
								with: [ self renderBreadcrumbFirstItemOn: html ].
							html space.
							self renderBreadcrumbSecondItemOn: html ] ] ]
]

{ #category : #rendering }
OOPage >> renderBreadcrumbSecondItemOn: html [
	self breadcrumpSubLabel ifNil: [ ^ self ].
	
	html tbsBreadcrumbSection
		beActive;
		with: self breadcrumpSubLabel
]

{ #category : #rendering }
OOPage >> renderComponentOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
OOPage >> renderContentOn: html [
	self renderBreadcrumbOn: html.
	self renderTitleOn: html.
	self renderComponentOn: html
]

{ #category : #rendering }
OOPage >> renderTitleOn: html [
	self title
		ifEmpty: [ html div style: 'margin-top: 20px;'.
			^ self ].
		
	html
		tbsContainer: [ html
				tbsPageHeader: [ html
						tbsRow: [ html
								tbsColMs: 10
								mo: 1
								with: [ html heading
										beCentered;
										with: self title.
									html paragraph: self description ] ] ] ]
]

{ #category : #accessing }
OOPage >> title [
	^ self subclassResponsibility
]
