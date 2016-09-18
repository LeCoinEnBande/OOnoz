rendering
renderContentOn: html
	html div
		style: 'background-color: grey;height:100%; width: 100%;overflow: auto;';
		with: [ | mcqs |
			mcqs := OOMCQ selectAll.
			mcqs
				ifEmpty: [ html anchor
						callback: [ OODevHelper launchInMemoryVoyageBackEnd.
							OODevHelper testingMCQInstance save ];
						with: [ html text: 'Initialize a MCQ by exucting: `OODevHelper launchInMemoryVoyageBackEnd. OODevHelper testingMCQInstance save` or by clicking on this link.' ] ]
				ifNotEmpty: [ html render: (OOMCQComponent model: mcqs anyOne) ] ]