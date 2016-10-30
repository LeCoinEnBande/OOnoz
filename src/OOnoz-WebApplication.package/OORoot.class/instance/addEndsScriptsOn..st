rendering
addEndsScriptsOn: html
	html script url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.min.js'.
	html script url: 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/locale/bootstrap-table-fr-FR.min.js'.
	html script url: self configuration resourcesURL , '/Dependencies/bootstrap-datepicker/js/bootstrap-datepicker.min.js'.
	html script url: self configuration resourcesURL , '/Dependencies/bootstrap-datepicker/locales/bootstrap-datepicker.fr.min.js'.
	html script url: 'https://cdn.jsdelivr.net/jquery.autosize/3.0.17/autosize.min.js'.
	html script: 'autosize($(''textarea''));'.