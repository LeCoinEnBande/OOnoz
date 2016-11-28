updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	anHtmlRoot meta
		responseHeaderName: 'X-UA-Compatible';
		content: 'IE=edge'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	anHtmlRoot title: 'OOnoz - Des milliers de questionnaires'.
	self updateTabIconRoot: anHtmlRoot.
	anHtmlRoot stylesheet
		url: 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';
		attributeAt: 'integrity' put: 'sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u';
		attributeAt: 'crossorigin' put: 'anonymous'.
	anHtmlRoot stylesheet
		url: 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css';
		attributeAt: 'integrity' put: 'sha256-AIodEDkC8V/bHBkfyxzolUMw57jeQ9CauwhVW6YJ9CA=';
		attributeAt: 'crossorigin' put: 'anonymous'.
	anHtmlRoot stylesheet url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.min.css'.
	anHtmlRoot stylesheet
		url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.2.0/css/bootstrap-slider.min.css';
		attributeAt: 'integrity' put: 'sha256-H6C3l25ZwMalTkgPDWuhR+1AaD6bKtFU4gTKJprFIt8=';
		attributeAt: 'crossorigin' put: 'anonymous'.
	anHtmlRoot stylesheet
		url: self configuration resourcesURL , '/Dependencies/bootstrap-datepicker/css/bootstrap-datepicker3.standalone.min.css'.
	anHtmlRoot stylesheet url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.0/css/bootstrap-select.min.css'.
	anHtmlRoot stylesheet url: self configuration resourcesURL , '/Maquettes/css/main.css'