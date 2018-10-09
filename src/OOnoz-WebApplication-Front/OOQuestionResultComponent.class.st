Class {
	#name : #OOQuestionResultComponent,
	#superclass : #OOComponent,
	#instVars : [
		'owner',
		'result',
		'index'
	],
	#category : 'OOnoz-WebApplication-Front-Components'
}

{ #category : #'instance creation' }
OOQuestionResultComponent class >> result: aQuestionResult index: anInteger [
	^ self new
		result: aQuestionResult;
		index: anInteger;
		yourself
]

{ #category : #accessing }
OOQuestionResultComponent >> answersId [
	^ 'questionAnswers' , self index greaseString
]

{ #category : #accessing }
OOQuestionResultComponent >> id [
	^ 'question' , self index greaseString
]

{ #category : #accessing }
OOQuestionResultComponent >> index [
	^ index
]

{ #category : #accessing }
OOQuestionResultComponent >> index: anObject [
	index := anObject
]

{ #category : #accessing }
OOQuestionResultComponent >> question [
	^ self result question
]

{ #category : #rendering }
OOQuestionResultComponent >> renderAlertOn: html [
	self question hasCorrection ifFalse: [ ^ self ].
	
	html aside
		class: #alert;
		class: #'alert-success' if: self result isCorrect;
		class: #'alert-danger' if: self result isCorrect not;
		with: self question correction
]

{ #category : #rendering }
OOQuestionResultComponent >> renderAnswersOn: html [
	html
		tbsColumn: [ html
				article: [ html
						header: [ html heading
								level3;
								with: 'Vos réponses' ].
					html section: [ self question renderAnswersResultFrom: self on: html ] ] ]
		mediumSize: 6.
	html
		tbsColumn: [ html
				article: [ html
						header: [ html heading
								level3;
								with: 'Les solutions' ].
					html section: [ self question renderAnswersSolutionFrom: self on: html ] ] ]
		mediumSize: 6
]

{ #category : #rendering }
OOQuestionResultComponent >> renderContentOn: html [
	html tbsArticlePanel
		beDefault;
		with: [ self renderHeaderOn: html.
			html div
				id: self id;
				class: #'panel-collapse';
				class: #collapse;
				class: #in;
				role: #tabpanel;
				ariaLabelledBy: self titleId;
				with: [ html section
						class: #'panel-body';
						with: [ html heading
								level2;
								with: self question description.
							self renderAlertOn: html.
							html tbsRow: [ self renderAnswersOn: html ] ] ] ]
]

{ #category : #rendering }
OOQuestionResultComponent >> renderHeaderOn: html [
	html tbsArticlePanelHeader
		id: self titleId;
		toggle: #collapse;
		parent: #'#questionsList';
		target: self id;
		ariaExpanded: true;
		ariaControles: self id;
		with: [ html tbsPanelTitle
				level3;
				with: [ html text: 'Question ' , self index greaseString.
					html div
						tbsPullRight;
						with: [ html tbsBadge
								beSuccessIf: self result isCorrect;
								beDangerIf: self result isCorrect not;
								with: self result printResult ] ] ]
]

{ #category : #accessing }
OOQuestionResultComponent >> result [
	^ result
]

{ #category : #accessing }
OOQuestionResultComponent >> result: anObject [
	result := anObject
]

{ #category : #accessing }
OOQuestionResultComponent >> resultAt: anAnswer [
	^ self result at: anAnswer
]

{ #category : #accessing }
OOQuestionResultComponent >> titleId [
	^ 'QuestionTitle' , self index greaseString
]
