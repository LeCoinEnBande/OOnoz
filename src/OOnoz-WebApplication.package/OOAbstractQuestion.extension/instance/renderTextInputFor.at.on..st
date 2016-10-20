*OOnoz-WebApplication
renderTextInputFor: anAnswer at: anAnswerInd on: html
	html textInput
		tbsFormControl;
		value: anAnswer text;
		placeholder: 'Réponse ' , anAnswerInd asString;
		onChange: html jQuery ajax serializeThis;
		callback: [ :text | anAnswer text: text ]