rendering
renderContentOn: html
	self renderTitleOn: html.
	html
		tbsContainer: [ html
				form: [ html
						article: [ self renderErrorOn: html.
							self renderGlobalConfigurationOn: html.
							self renderOtherOptionsOn: html.
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
								with: [ self renderButtonsOn: html.
									html tbsButton
										bePush;
										beDanger;
										dataToggle: 'modal';
										dataTarget: '#' , html nextId;
										with: 'Annuler' ] ] ].
			self renderCancelModalFor: html lastId on: html ]