*OOnoz-WebApplication
renderTextInputFor: anAnswer from: aComponent on: html
	self flag: #todo. "Should move to answer?"
	html textInput
		tbsFormControl;
		value: anAnswer text;
		placeholder: 'Réponse ' , anAnswer index asString;
		onChange: html jQuery ajax serializeThis;
		callback: [ :text | anAnswer text: text ]