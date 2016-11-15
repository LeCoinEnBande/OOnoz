*OOnoz-WebApplication-Core
tbsDismissAlertButton
	^ self tbsButton
		dataDismiss: #alert;
		beClose;
		bePush;
		ariaLabel: #Close;
		with: [ self tbsAlertCloseSpan ]