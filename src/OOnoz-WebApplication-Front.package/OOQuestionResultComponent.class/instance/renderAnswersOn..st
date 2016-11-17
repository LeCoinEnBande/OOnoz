rendering
renderAnswersOn: html
	html
		tbsColumn: [ html
				article: [ html
						header: [ html heading
								level3;
								with: 'Vos réponses' ].
					html section: [ self question renderAnswersResultFrom: self on: html ] ] ]
		mediumSize: 6.
	html
		tbsColumn: [ html
				article: [ html
						header: [ html heading
								level3;
								with: 'Les solutions' ].
					html section: [ self question renderAnswersSolutionFrom: self on: html ] ] ]
		mediumSize: 6