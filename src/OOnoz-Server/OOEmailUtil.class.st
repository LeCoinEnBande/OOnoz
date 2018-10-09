"
OOEmailUtil sendEmailTo: 'cyril.ferlicot@gmail.com' subject: 'Inscription' htmlBody: '<html><head></head><body>This is html.</body></html>'
"
Class {
	#name : #OOEmailUtil,
	#superclass : #Object,
	#category : 'OOnoz-Server'
}

{ #category : #accessing }
OOEmailUtil class >> configuration [
	^ OOServer current configuration
]

{ #category : #facade }
OOEmailUtil class >> sendEmailTo: anEmail subject: aString htmlBody: html [
	| smtpClient mailMessage |
	mailMessage := MailMessage empty.
	mailMessage setField: 'from' toString: 'OOnoz'.
	mailMessage setField: 'to' toString: anEmail.
	mailMessage setField: 'subject' toString: aString.
	mailMessage addAlternativePart: html contentType: 'text/html'.
	(smtpClient := ZdcSecureSMTPClient new)
		user: self configuration email;
		password: self configuration emailPass.
	smtpClient openOnHost: (NetNameResolver addressForName: (self configuration emailServer)) port: self configuration emailPort.
	^ smtpClient
		mailFrom: 'oonoz.company@gmail.com' to: (Array with: anEmail) text: mailMessage text;
		quit;
		close;
		yourself
]
