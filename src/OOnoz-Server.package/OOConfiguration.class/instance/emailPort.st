accessing - parameters
emailPort
	"I am the email port that should be use to send the mails of the application."

	^ self parameters at: 'emailPort' ifAbsentPut: 465