removing
removeDevToolbar
	WAAdmin disableDevelopmentTools.
	"What is following is a hack because of a seaside bug."
	#(#OOBackRoot #OOFrontRoot #OORequestHandler)
		do: [ :e | 
			[ e asClass initialize ]
				on: NotFound
				do: [  ] ]