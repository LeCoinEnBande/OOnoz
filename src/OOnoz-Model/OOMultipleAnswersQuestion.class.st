"
I am a question that can have multiple right answer. 
I can have between 2 and 6 answers.
"
Class {
	#name : #OOMultipleAnswersQuestion,
	#superclass : #OOAbstractQuestion,
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #magicNumbers }
OOMultipleAnswersQuestion class >> maxNumberOfRightAnswers [
	^ self maximumNumberOfAnswers -1
]

{ #category : #magicNumbers }
OOMultipleAnswersQuestion class >> maximumNumberOfAnswers [
	^ 6
]

{ #category : #magicNumbers }
OOMultipleAnswersQuestion class >> minNumberOfRightAnswers [
	^ 1
]

{ #category : #magicNumbers }
OOMultipleAnswersQuestion class >> minimumNumberOfAnswers [
	^ 3
]

{ #category : #validation }
OOMultipleAnswersQuestion >> maxNumberOfRightAnswers [
	^ self questionClass maxNumberOfRightAnswers min: self answers size - 1
]

{ #category : #validation }
OOMultipleAnswersQuestion >> validate [
	super validate.
	((self answers select: #isRight) size
		between: self minNumberOfRightAnswers
		and: self maxNumberOfRightAnswers)
		ifFalse: [ self
				invalidate:
					(String
						streamContents: [ :s | 
							s
								<< 'Le nombre de réponses valides doit être compris entre ';
								<< self minNumberOfRightAnswers;
								<< ' et ';
								<< self maxNumberOfRightAnswers;
								<< $. ]) ]
]
