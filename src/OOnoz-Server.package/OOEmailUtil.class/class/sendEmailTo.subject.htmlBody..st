facade
sendEmailTo: anEmail subject: aString htmlBody: html
	| smtpClient mailMessage |
	self flag: #clean.	"Credential here is bad…"
	mailMessage := MailMessage empty.
	mailMessage setField: 'from' toString: 'OOnoz'.
	mailMessage setField: 'to' toString: anEmail.
	mailMessage setField: 'subject' toString: aString.
	mailMessage addAlternativePart: html contentType: 'text/html'.
	(smtpClient := ZdcSecureSMTPClient new)
		user: 'oonoz.company@gmail.com';
		password: 'OOnozProject'.
	smtpClient openOnHost: (NetNameResolver addressForName: 'smtp.gmail.com') port: 465.
	^ smtpClient
		mailFrom: 'oonoz.company@gmail.com' to: {anEmail} text: mailMessage text;
		quit;
		close;
		yourself