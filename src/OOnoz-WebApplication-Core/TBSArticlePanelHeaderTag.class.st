Class {
	#name : #TBSArticlePanelHeaderTag,
	#superclass : #WATagBrush,
	#category : 'OOnoz-WebApplication-Core-Bootstrap'
}

{ #category : #initialization }
TBSArticlePanelHeaderTag >> initialize [
	super initialize.
	self role: #tab.
	self class: #'panel-heading'
]

{ #category : #accessing }
TBSArticlePanelHeaderTag >> parent: aString [
	self attributeAt: #'data-parent' put: aString
]

{ #category : #accessing }
TBSArticlePanelHeaderTag >> parent: aString if: aBoolean [
	aBoolean
		ifTrue: [ self parent: aString ]
]

{ #category : #accessing }
TBSArticlePanelHeaderTag >> tag [
	^ 'header'
]

{ #category : #accessing }
TBSArticlePanelHeaderTag >> target: aString [
	self attributeAt: #'data-target' put: '#' , aString
]

{ #category : #accessing }
TBSArticlePanelHeaderTag >> toggle: aString [
	self attributeAt: #'data-toggle' put: aString
]

{ #category : #accessing }
TBSArticlePanelHeaderTag >> toggle: aString if: aBoolean [
	aBoolean
		ifTrue: [ self toggle: aString ]
]
