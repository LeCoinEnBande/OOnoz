rendering
renderAvatarManagementOn: html
	html form
		multipart;
		class: #'text-center';
		with: [ self renderAvatarInuputOn: html ].
	html tbsContainer
		class: #'text-center';
		with: [ html
				tbsRow: [ html tbsColumn
						mediumSize: 6;
						mediumOffset: 3;
						with: [ self user hasAvatar
								ifTrue: [ html tbsAnchor
										beOutline;
										beDanger;
										callback: [ self user hasAvatar: false.
											self user save ];
										with: 'Supprimer Avatar' ].
							(self user hasAvatar not and: [ (self configuration resourcesDirectory / 'Avatars' / (self user mail , '.png')) exists ])
								ifTrue: [ html tbsAnchor
										beOutline;
										beInfo;
										callback: [ self user hasAvatar: true.
											self user save ];
										with: 'Restaurer le dernier avatar' ] ] ] ]