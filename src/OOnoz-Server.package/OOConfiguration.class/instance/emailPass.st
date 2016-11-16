accessing - parameters
emailPass
	"I am the password of the email that should be use to send the mails of the application."

	^ self parameters at: 'emailPass' ifAbsentPut: 'OOnozProject'