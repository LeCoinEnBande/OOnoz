Class {
	#name : #OOConfigurerPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'configuration',
		'validationBlock',
		'portLabel',
		'portInput',
		'emailLabel',
		'emailInput'
	],
	#category : #'OOnoz-Development-Configuration'
}

{ #category : #specs }
OOConfigurerPresenter class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :col | 
			col
				newRow: [ :row | 
					row
						add: #emailLabel width: self oonozLabelWidth;
						add: #emailInput ]
					height: self inputTextHeight;
				addSpacer ]
]

{ #category : #specs }
OOConfigurerPresenter class >> open [
	<script>
	self new openWithSpec
]

{ #category : #specs }
OOConfigurerPresenter class >> title [
	^ 'Configuration wizard'
]

{ #category : #accessing }
OOConfigurerPresenter >> configuration [
	^ configuration
]

{ #category : #accessing }
OOConfigurerPresenter >> configuration: anObject [
	configuration := anObject
]

{ #category : #accessing }
OOConfigurerPresenter >> emailInput [
	^ emailInput
]

{ #category : #accessing }
OOConfigurerPresenter >> emailInput: anObject [
	emailInput := anObject
]

{ #category : #accessing }
OOConfigurerPresenter >> emailLabel [
	^ emailLabel
]

{ #category : #accessing }
OOConfigurerPresenter >> emailLabel: anObject [
	emailLabel := anObject
]

{ #category : #initialization }
OOConfigurerPresenter >> initialize [
	super initialize.
	configuration := OOConfiguration new
]

{ #category : #initialization }
OOConfigurerPresenter >> initializeWidgets [
	emailLabel := self newLabel.
	emailInput := self newTextInput.
	portLabel := self newLabel.
	portInput := self newTextInput.
	
	emailLabel label: 'Email'.
]

{ #category : #accessing }
OOConfigurerPresenter >> portInput [
	^ portInput
]

{ #category : #accessing }
OOConfigurerPresenter >> portInput: anObject [
	portInput := anObject
]

{ #category : #accessing }
OOConfigurerPresenter >> portLabel [
	^ portLabel
]

{ #category : #accessing }
OOConfigurerPresenter >> portLabel: anObject [
	portLabel := anObject
]

{ #category : #accessing }
OOConfigurerPresenter >> validationBlock [
	^ validationBlock
]

{ #category : #accessing }
OOConfigurerPresenter >> validationBlock: anObject [
	validationBlock := anObject
]
