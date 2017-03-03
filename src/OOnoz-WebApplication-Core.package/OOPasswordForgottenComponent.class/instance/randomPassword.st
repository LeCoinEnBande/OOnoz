generation
randomPassword
	| rand password charsets ix lastSet |
	rand := Random seed: Time millisecondClockValue hash.
	charsets := {'abcdefghijklmnopqrstuvwxyz' . '123456789' . 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' . '+#-_,:!'}.
	password := String new: 10.
	ix := 1.
	[ ix <= 10 ]
		whileTrue: [ | set |
			set := charsets atRandom: rand.
			set == lastSet
				ifFalse: [ password at: ix put: (set atRandom: rand).
					lastSet := set.
					ix := ix + 1 ] ].
	charsets
		do: [ :coll | 
			(password anySatisfy: [ :let | coll includes: let ])
				ifFalse: [ password := password , (coll atRandom: rand) asString ] ].
	^ password