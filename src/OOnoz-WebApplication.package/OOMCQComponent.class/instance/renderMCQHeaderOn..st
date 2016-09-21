rendering
renderMCQHeaderOn: html
	self flag: #style. "Move style to scss"
	html mdlCardTitle
		style:
			(String
				streamContents: [ :s | 
					s
						<< 'background-image: url(''';
						<< self configuration mcqHeaderUrl;
						<< ''');';
						<<
							'opacity: 0.8;height: 100px; color: #fff;text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black; background-repeat: no-repeat; background-position: center center; background-attachment: fixed; background-size: cover;' ])