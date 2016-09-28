rendering
renderContentOn: html
	html div
		style: 'background-color: #BDBDBD;height:100%; width: 100%;overflow: auto;';
		with: [ self mcq
				ifNil: [ [ mcq := OOMCQComponent model: OOMCQ selectAll anyOne ]
						on: MessageNotUnderstood
						do: [ html anchor
								callback: [ OODevHelper launchInMemoryVoyageBackEnd.
									OODevHelper testingMCQInstance save ];
								with: [ html text: 'Initialize a MCQ by exucting: `OODevHelper launchInMemoryVoyageBackEnd. OODevHelper testingMCQInstance save` or by clicking on this link.' ] ].
					mcq ifNotNil: [ html render: mcq ] ]
				ifNotNil: [ html render: mcq ] ]