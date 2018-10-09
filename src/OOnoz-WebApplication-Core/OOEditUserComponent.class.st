Class {
	#name : #OOEditUserComponent,
	#superclass : #OOProfileComponent,
	#category : 'OOnoz-WebApplication-Core-Components'
}

{ #category : #actions }
OOEditUserComponent >> cancel [
	self user restoreFromMemento: self memento.
	self answer: false
]

{ #category : #rendering }
OOEditUserComponent >> renderButtonsOn: html [
	html div
		class: #clearfix;
		with: [ html div
				tbsPullRight;
				style: 'margin: 20px;';
				with: [ | id |
					self renderSaveButtonOn: html.
					html space.
					self renderResetButtonOn: html.
					html space.
					id := self renderCancelButtonOn: html.
					self renderCancelModalFor: id on: html ] ]
]
