generation
randomPassword
	| rand lastSet charsets |
	rand := Random seed: Time millisecondClockValue hash.
	charsets := {Character alphabet.
	(Character alphabet collect: #asUppercase).
	(0 to: 9).
	'+#-_,:!'}.
	^ String
		streamContents: [ :s | 
			1 to: 10 do: [ :i | 
				| set |
				set := charsets atRandom: rand.
				set == lastSet
					ifFalse: [ s << (set atRandom: rand).
						lastSet := set ] ] ]