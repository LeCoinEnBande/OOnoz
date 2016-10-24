I am an abstract class describing a Question.

Description
---------------------

A Question has a description and a list of answer. The number of answers and of right answers will depend of my subclasses.
I might have an explanation and a media.

I should be held by a OOMCQ and I contains OOAnswer.

Public API and Key Messages
---------------------

- #validate 				If the question is not right, it should raise an error.
- #randomizedAnswers 	Return a collection of answers in random order. 
 
Internal Representation and Key Implementation Points.
---------------------

    Instance Variables
	answers:		<aSet>				A set of answers for the question.
	description:		<aString>			A description for the question.
	explanation:		<anExplanation>		An optional explanation.
	media:			<???>

