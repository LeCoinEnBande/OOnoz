Extension { #name : #WATagBrush }

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> ariaControles: aString [
	self attributeAt: 'aria-controles' put: aString
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> ariaDescribedby: aString [
	self attributeAt: 'aria-describedby' put: aString
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> ariaExpanded [
	self ariaExpanded: true
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> ariaExpanded: aBoolean [
	self attributeAt: 'aria-expanded' put: aBoolean greaseString
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> ariaHaspopup: aBoolean [
	self attributeAt: 'aria-haspopup' put: aBoolean greaseString
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> ariaHidden: aBoolean [
	self attributeAt: 'aria-hidden' put: aBoolean greaseString
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> ariaLabel: aString [
	self attributeAt: 'aria-label' put: aString
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> ariaLabelledBy: aString [
	self attributeAt: 'aria-labelledBy' put: aString
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> ariaMultiselectable: aBoolean [
	self attributeAt: 'aria-multiselectable' put: aBoolean greaseString 
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> attributeAt: aString put: anObject if: aBoolean [
	aBoolean
		ifTrue: [ self attributeAt: aString put: anObject ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> beCentered [
	self class: 'text-center'
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> beDefaultIf: aBoolean [
	aBoolean
		ifTrue: [ self beDefault ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> beInfoIf: aBoolean [
	aBoolean
		ifTrue: [ self beInfo ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> canvas [
	^ canvas
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> dataTarget: aString [
	self attributeAt: 'data-target' put: aString
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> dataToggle: aString [
	self attributeAt: 'data-toggle' put: aString
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> onClick: anObject if: aBoolean [
	aBoolean ifTrue: [ self onClick: anObject ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> onClickUpdateRootDialogWith: aBlock [
	self
		onClick: ((canvas jQuery id: #'root-dialog') load html: aBlock);
		dataToggle: 'modal';
		dataTarget: #'#root-dialog__open'
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> onClickUpdateRootDialogWith: aBlock if: aBoolean [
	aBoolean
		ifTrue: [ self onClickUpdateRootDialogWith: aBlock ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
WATagBrush >> tbsTooltip: aString if: aBoolean [
	aBoolean
		ifTrue: [ self tbsTooltip: aString ]
]
