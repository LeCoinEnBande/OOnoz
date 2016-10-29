accessing - parameters
email
	"I am the email that should be use to send the mails of the application."

	^ self parameters at: 'email' ifAbsentPut: 'oonoz.company@gmail.com'