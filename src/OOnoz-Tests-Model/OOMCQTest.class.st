Class {
	#name : #OOMCQTest,
	#superclass : #OOAbstractMCQTest,
	#category : 'OOnoz-Tests-Model-MCQ'
}

{ #category : #accessing }
OOMCQTest >> actualClass [
	^ OOMCQ
]

{ #category : #'instance creation' }
OOMCQTest >> newMCQInstance [
	| subtheme |
	subtheme := OOSubTheme title: 'subtest' description: 'subtest description'.
	(OOTheme title: 'test' description: 'test description') addSubTheme: subtheme.
	^ (self actualClass questions: (Set with: OOMultipleAnswersQuestionTest new newQuestionInstance))
		title: 'A title';
		markingScheme: OOStrictScheme;
		addSubTheme: subtheme;
		yourself
]
