accessing
cipher: aString
	self mail ifNil: [ ^ self error: 'The mail is needed to set the passowrd.' ].
	^ (SHA256
		hashMessage:
			(String
				streamContents: [ :s | 
					s
						<< 'Furry';
						<< aString;
						<< (self mail copyUpTo: $@) ])) hex