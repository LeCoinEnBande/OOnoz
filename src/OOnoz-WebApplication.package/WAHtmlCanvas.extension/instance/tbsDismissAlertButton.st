*OOnoz-WebApplication
tbsDismissAlertButton
	^ self tbsButton
		dataDismiss: #alert;
		beClose;
		bePush;
		attributeAt: #'aria-label' put: #Close;
		with: [ self tbsAlertCloseSpan ]