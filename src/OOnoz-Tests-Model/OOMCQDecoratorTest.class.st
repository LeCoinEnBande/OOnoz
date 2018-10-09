Class {
	#name : #OOMCQDecoratorTest,
	#superclass : #OOAbstractMCQTest,
	#category : 'OOnoz-Tests-Model-MCQ'
}

{ #category : #accessing }
OOMCQDecoratorTest >> actualClass [
	^ OOMCQDecorator
]

{ #category : #'instance creation' }
OOMCQDecoratorTest >> newMCQInstance [
	| subtheme |
	subtheme := OOSubTheme title: 'subtest' description: 'subtest description'.
	(OOTheme title: 'test' description: 'test description') addSubTheme: subtheme.
	^ self actualClass
		decorate:
			(OOMCQ new
				questions: (Set with: OOMultipleAnswersQuestionTest new newQuestionInstance);
				title: 'A title';
				markingScheme: OOStrictScheme;
				addSubTheme: subtheme;
				yourself)
]
