I am the Answer of an OOQuestion.

Description
---------------------

I am a simple objet having the text to show to the user and knowing if I am right or wrong for the question.

I should be held by an OOQuestion.

Example
---------------------

	OOAnswer text: 'Answer D!' isRight: false
 
Internal Representation and Key Implementation Points.
---------------------

    Instance Variables
	isRight:		<aBoolean>		True if the answer is right for the question containing me.
	text:		<aString>		The text of the answer to show to the user.
