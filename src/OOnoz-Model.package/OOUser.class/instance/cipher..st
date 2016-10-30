accessing
cipher: aString
	^ (SHA256
		hashMessage:
			(String
				streamContents: [ :s | 
					s
						<< 'Furry';
						<< aString;
						<< (self mail copyUpTo: $@) ])) hex