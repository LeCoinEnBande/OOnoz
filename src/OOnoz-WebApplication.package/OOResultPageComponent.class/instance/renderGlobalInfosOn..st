rendering
renderGlobalInfosOn: html
	html
		section: [ html tbsRow
				class: #'text-center';
				with: [ html
						tbsColumn: [ html heading
								level2;
								with:
									(String
										streamContents: [ :s | 
											s << 'Score: '.
											self mcqResult printResultOn: s ]) ]
						mediumSize: 4.
					html
						tbsColumn: [ html heading
								level2;
								with: self mcqResult printDetailedResult ]
						mediumSize: 4.
					html
						tbsColumn: [ html heading
								level2;
								with:
									(String
										streamContents: [ :s | 
											| results |
											results := OOMCQResult selectMany: [ :result | result isFinished and: [ result mcq = self mcqResult mcq ] ].
											s
												<< 'Rang: ';
												<<
													((results
														select: [ :r | r result > self mcqResult result or: [ r result = self mcqResult and: [ r dateEnd < self mcqResult dateEnd ] ] ])
														size + 1);
												<< ' sur ';
												<< results size ]) ]
						mediumSize: 4 ] ]