Class {
	#name : #OOConfigurerPresenter,
	#superclass : #ComposablePresenter,
	#instVars : [
		'configuration',
		'validationBlock',
		'portLabel',
		'portInput',
		'emailPresenter'
	],
	#category : #'OOnoz-Development-Configuration'
}

{ #category : #specs }
OOConfigurerPresenter class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :col | 
			col
				newRow: [ :r | r add: #emailPresenter ] height: self labelledPresenterHeight;
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

{ #category : #specs }
OOConfigurerPresenter class >> worldMenuEntryOn: aBuilder [
	<worldMenu>
	(aBuilder item: #Configurer)
		order: 10.0;
		label: 'Configurer';
		iconName: 'smallWindow';
		action: [ self open ];
		withSeparatorAfter
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
OOConfigurerPresenter >> emailPresenter [
	^ emailPresenter
]

{ #category : #specs }
OOConfigurerPresenter >> extent [ 
	^ 500 @ 400
]

{ #category : #initialization }
OOConfigurerPresenter >> initialize [
	super initialize.
	configuration := OOConfiguration new
]

{ #category : #initialization }
OOConfigurerPresenter >> initializeWidgets [
	emailPresenter := self instantiate: (LabelledPresenter label: 'Email' input: self newTextInput description: 'Email adress to use to send activation and informations emails.')
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
