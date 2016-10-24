helpers
answers
	^ {('Answer1' -> true).
	('Answer2' -> false).
	('Answer3' -> true).
	('Answer4' -> true).
	('Answer5' -> false)} collect: [ :asso | OOAnswer text: asso key isRight: asso value ]