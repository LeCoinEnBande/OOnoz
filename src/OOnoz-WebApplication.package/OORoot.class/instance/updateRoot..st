updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	self flag: #todo.	"When we will have a tab logo we will put it here."
	"anHtmlRoot link
		beShortcutIcon;
		url: ."
	anHtmlRoot meta
		responseHeaderName: 'X-UA-Compatible';
		content: 'IE=edge'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	anHtmlRoot title: 'OOnoz - Des milliers de questionnaires'.
	anHtmlRoot stylesheet
		url: 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css';
		attributeAt: 'integrity' put: 'sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u';
		attributeAt: 'crossorigin' put: 'anonymous'.
	anHtmlRoot stylesheet
		url: 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css';
		attributeAt: 'integrity' put: 'sha256-AIodEDkC8V/bHBkfyxzolUMw57jeQ9CauwhVW6YJ9CA=';
		attributeAt: 'crossorigin' put: 'anonymous'.
	anHtmlRoot stylesheet url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.min.css'.
	anHtmlRoot stylesheet url: self configuration resourcesURL , '/css/main.css'