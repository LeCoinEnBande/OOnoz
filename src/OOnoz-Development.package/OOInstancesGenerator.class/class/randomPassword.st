accessing
randomPassword
	| rand generator charsets |
	"Not ideal random for passwords..."
	rand := Random seed: Time millisecondClockValue hash.
	charsets := {'abcdefghijklmnopqrstuvwxyz' . '123456789' . 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' . '+#-_,:!'}.
	generator := [ :len | 
	| password ix lastSet |
	password := String new: len.
	ix := 1.
	[ ix <= len ]
		whileTrue: [ | set |
			set := charsets atRandom: rand.
			set == lastSet
				ifFalse: [ password at: ix put: (set atRandom: rand).
					lastSet := set.
					ix := ix + 1 ] ].
	password ].
	generator value: 42