I am the core of the model: the MCQ.

Description
---------------------

A MCQ is composed of a title and questions. I have a marking scheme to mark a user answers. 

I am composed of OOAbstractQuestion. 

Public API and Key Messages
---------------------

- #randowizedQuestion 	Return the questions in a random order.
- #validate 				If the MCQ is not valid, I will raise an error.

Example
---------------------
 
	OOMCQ new
		title: 'Title';
		markirgScheme: OOStrictMarkingScheme;
		addQuestion: aQuestion;
		yourself

Internal Representation and Key Implementation Points
---------------------

    Instance Variables
	markingScheme:		<aMarkingScheme> 	An object to mark a user answers
	questions:			<aSet>				A Set of questions
	title:				<aString>			The title of the MCQ


    Implementation Points