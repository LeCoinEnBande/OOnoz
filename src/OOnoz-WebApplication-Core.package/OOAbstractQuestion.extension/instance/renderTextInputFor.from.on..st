*OOnoz-WebApplication-Core
renderTextInputFor: anAnswer from: aComponent on: html
	html textInput
		tbsFormControl;
		value: anAnswer text;
		placeholder: 'Proposition ' , anAnswer index asString;
		onChange:
			(html jQuery ajax
				serializeThis;
				onSuccess: (aComponent refreshBadgeOn: html));
		callback: [ :text | anAnswer text: text ]