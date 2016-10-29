accessing - parameters
emailServer
	"I am the email server that should be use to send the mails of the application."

	^ self parameters at: 'emailServer' ifAbsentPut: 'smtp.gmail.com'