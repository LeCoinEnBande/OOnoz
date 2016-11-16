as yet unclassified
sendSubscriptionEmail
	self flag: #todo.
	self emailUtils
		sendEmailTo: self user mail
		subject: 'Inscription à OOnoz'
		htmlBody:
			(String
				streamContents: [ :s | 
					s
						<< '<html><body>';
						<< 'http://';
						<< self configuration domainName;
						<< $:;
						<< self configuration port;
						<< '/OOnozValidation?key=';
						<< self user mail;
						<< '&value=';
						<< self user mail hash;
						<< '</body></html>' ])