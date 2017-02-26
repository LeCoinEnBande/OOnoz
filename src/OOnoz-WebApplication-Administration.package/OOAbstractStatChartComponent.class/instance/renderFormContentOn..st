rendering
renderFormContentOn: html
	html heading
		level3;
		with: 'Filtres'.
	html hr.
	html render: self mcqFilter.
	self renderHookOn: html.
	html tbsAnchor
		beWarning;
		callback: [ self mcqInputCache: nil.
			self resetFilters ];
		with: 'Réinitialiser'