*OOnoz-WebApplication-Core
tbsAlertCloseSpan
	^ self span
		attributeAt: #'aria-hidden' put: #true;
		with: [ self html: '&times;' ]