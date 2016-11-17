actions
updateAvatar: aFile
	aFile size <= (1024 * 1024)
		ifFalse: [ self avatarError: 'Fichier trop gros. Maximum: 1Mo.'.
			^ self ].
	aFile contentType greaseString = 'image/png'
		ifFalse: [ self avatarError: 'Le fichier doit être une image.'.
			^ self ].
	(self configuration resourcesDirectory / 'Avatars' / (self user mail , '.' , aFile contentType sub))
		ensureCreateFile;
		writeStreamDo: [ :s | 
			s
				binary;
				<< aFile contents ].
	self user hasAvatar: true.
	self user save