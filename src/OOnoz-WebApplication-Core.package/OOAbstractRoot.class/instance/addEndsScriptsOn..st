rendering
addEndsScriptsOn: html
	html script url: 'https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'.
	html script
		url: 'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js';
		attributeAt: 'integrity'
			put: 'sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa';
		attributeAt: 'crossorigin' put: 'anonymous'.
	html script
		url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.2.0/bootstrap-slider.min.js';
		attributeAt: 'integrity' put: 'sha256-jkZPPiQWvKWEpTyXospDAsDOUMnqYwPObBRISK6FNHM=';
		attributeAt: 'crossorigin' put: 'anonymous'.
	html script
		url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.min.js'.
	html script
		url:
			'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/locale/bootstrap-table-fr-FR.min.js'.
	html script
		url:
			self configuration resourcesURL
				, '/Dependencies/bootstrap-datepicker/js/bootstrap-datepicker.min.js'.
	html script
		url:
			self configuration resourcesURL
				, '/Dependencies/bootstrap-datepicker/locales/bootstrap-datepicker.fr.min.js'.
	html script
		url:
			'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.0/js/bootstrap-select.min.js'.
	html script
		url:
			'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.0/js/i18n/defaults-*.min.js'.
	html script url: 'https://cdn.jsdelivr.net/jquery.autosize/3.0.17/autosize.min.js'.
	html document
		addLoadScript: 'autosize($(''textarea''));$(''[data-toggle="tooltip"]'').tooltip();' js