Class {
	#name : #TBSAnchorTag,
	#superclass : #WAAnchorTag,
	#category : 'OOnoz-WebApplication-Core-Bootstrap'
}

{ #category : #sizes }
TBSAnchorTag >> beBlock [
	"Creates an extra small sized button."
	self beBlockIf: true
]

{ #category : #sizes }
TBSAnchorTag >> beBlockIf: aBlock [
	"Creates an block sized button if aBlock is true."
	self class: 'btn-block' if: aBlock
]

{ #category : #options }
TBSAnchorTag >> beDanger [
	"Creates an Danger type button."
	self beDangerIf: true
]

{ #category : #options }
TBSAnchorTag >> beDangerIf: aBlock [
	"Creates an Danger type button if aBlock is true."
	self class: 'btn-danger' if: aBlock
]

{ #category : #options }
TBSAnchorTag >> beDefault [
	"Creates an Default type button."
	self beDefaultIf: true
]

{ #category : #options }
TBSAnchorTag >> beDefaultIf: aBlock [
	"Creates an default type button if aBlock is true."
	self class: 'btn-default' if: aBlock
]

{ #category : #options }
TBSAnchorTag >> beDisabled [
	"Creates an Default type button."
	self beDisabledIf: true
]

{ #category : #options }
TBSAnchorTag >> beDisabledIf: aBlock [
	"Creates an default type button if aBlock is true."
	aBlock value ifTrue: [ self disabled: 'disabled' ]
]

{ #category : #sizes }
TBSAnchorTag >> beExtraSmall [
	"Creates an extra small sized button."
	self beExtraSmallIf: true
]

{ #category : #sizes }
TBSAnchorTag >> beExtraSmallIf: aBlock [
	"Creates an extra small sized button if aBlock is true."
	self class: 'btn-xs' if: aBlock
]

{ #category : #options }
TBSAnchorTag >> beInfo [
	"Creates an Info type button."
	self beInfoIf: true
]

{ #category : #options }
TBSAnchorTag >> beInfoIf: aBlock [
	"Creates an Info type button if aBlock is true."
	self class: 'btn-info' if: aBlock
]

{ #category : #options }
TBSAnchorTag >> beInverse [
	"Creates an Inverse type button."
	self class: 'btn-inverse'
]

{ #category : #sizes }
TBSAnchorTag >> beLarge [
	"Creates an large sized button."
	self beLargeIf: true
]

{ #category : #sizes }
TBSAnchorTag >> beLargeIf: aBlock [
	"Creates an large sized button if aBlock is true."
	self class: 'btn-lg' if: aBlock
]

{ #category : #options }
TBSAnchorTag >> beLink [
	"Creates an Link type button."
	self beLinkIf: true
]

{ #category : #options }
TBSAnchorTag >> beLinkIf: aBlock [
	"Creates an Link type button if aBlock is true."
	self class: 'btn-link' if: aBlock
]

{ #category : #options }
TBSAnchorTag >> beNavbarButton [

	self class: 'navbar-btn'
]

{ #category : #options }
TBSAnchorTag >> bePrimary [
	"Creates an Primary type button."
	self bePrimaryIf: true
]

{ #category : #options }
TBSAnchorTag >> bePrimaryIf: aBlock [
	"Creates an Primary type button if aBlock is true."
	self class: 'btn-primary' if: aBlock value
]

{ #category : #sizes }
TBSAnchorTag >> beSmall [
	"Creates an small sized button."
	self beSmallIf: true
]

{ #category : #sizes }
TBSAnchorTag >> beSmallIf: aBlock [
	"Creates a small sized button if aBlock is true."
	self class: 'btn-sm' if: aBlock
]

{ #category : #options }
TBSAnchorTag >> beSuccess [
	"Creates an Success type button if aBlock is true."
	self beSuccessIf: true
]

{ #category : #options }
TBSAnchorTag >> beSuccessIf: aBlock [
	"Creates an Success type button if aBlock is true."
	self class: 'btn-success' if: aBlock 
]

{ #category : #options }
TBSAnchorTag >> beWarning [
	"Creates an Warning type button."
	self beWarningIf: true
]

{ #category : #options }
TBSAnchorTag >> beWarningIf: aBlock [
	"Creates an Warning type button if aBlock is true."
	self class: 'btn-warning' if: aBlock
]

{ #category : #options }
TBSAnchorTag >> dataDismiss: aString [

	self attributes at: 'data-dismiss' put: aString
]

{ #category : #initialization }
TBSAnchorTag >> initialize [ 
	super initialize.
	self class: 'btn'
]
