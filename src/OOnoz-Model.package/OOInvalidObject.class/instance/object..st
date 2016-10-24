accessing
object: anObject
	object := anObject.
	self
		messageText:
			(String
				streamContents: [ :s | 
					s
						<< self object asString;
						<< ' is invalid.'.
					self reason ifNotNil: [ :r | s << r ] ])