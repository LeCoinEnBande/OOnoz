rendering
renderFormContentOn: html
	html render: self mcqFilter.
	self renderHookOn: html.
	html tbsAnchor
		beWarning;
		callback: [ self mcqInputCache: nil.
			self resetFilters ];
		with: 'Réinitialiser'