actions
sendSubscriptionEmail
	self flag: #todo.
	self emailUtils
		sendEmailTo: self user mail
		subject: 'Inscription à OOnoz'
		htmlBody:
			(self emailTemplate
				copyReplaceAll: '{{{URL}}}'
				with:
					(String
						streamContents: [ :s | 
							s
								<< 'http://';
								<< self configuration domainName;
								<< $:;
								<< self configuration port;
								<< '/OOnozValidation?key=';
								<< self user mail;
								<< '&value=';
								<< self user mail hash ]))