accessing
styleForResult
	self flag: #clean.	"The ifs here are really bad :) I need to clean that later :)"
	^ String
		streamContents: [ :s | 
			s
				<< 'color:';
				<< self colorForResult;
				<< $; ]