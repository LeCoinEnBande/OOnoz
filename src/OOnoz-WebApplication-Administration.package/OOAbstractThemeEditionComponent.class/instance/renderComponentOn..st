rendering
renderComponentOn: html
	html
		tbsContainer: [ html
				form: [ html
						article: [ self renderErrorOn: html.
							html
								tbsRow: [ html
										tbsColumn: [ self renderGlobalConfigurationOn: html.
											self renderOtherOptionsOn: html ]
										mediumSize: 8.
									html
										tbsColumn: [ html
												header: [ html heading
														level3;
														with: 'Image d''illustration' ].
											html section
												id: #themeImage;
												with: [ self renderImageOn: html ] ]
										mediumSize: 4 ].
							html
								tbsRow: [ html tbsColumn
										id: #subThemes;
										mediumSize: 10;
										mediumOffset: 2;
										with: [ self renderSubThemesOn: html ] ].
							html tbsButton
								bePush;
								beSuccess;
								onClick:
									((html jQuery id: #subThemes) load
										html: [ :r | 
											self theme addSubTheme: OOSubTheme new.
											self renderSubThemesOn: r ]);
								with: 'Ajouter un sous-thème'.
							html div
								tbsPullRight;
								style: 'margin: 20px;';
								with: [ self renderButtonsOn: html.
									html tbsButton
										bePush;
										beDanger;
										dataToggle: 'modal';
										dataTarget: '#' , self modalId;
										with: 'Annuler' ] ] ].
			self renderCancelModalOn: html ]