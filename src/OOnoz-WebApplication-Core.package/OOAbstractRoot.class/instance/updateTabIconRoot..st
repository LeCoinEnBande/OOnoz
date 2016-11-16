updating
updateTabIconRoot: anHtmlRoot
	anHtmlRoot link
		relationship: 'apple-touch-icon';
		attributeAt: 'sizes' put: '180x180';
		url: self configuration resourcesURL , '/Maquettes/images/favicon/apple-touch-icon-180x180.png'.
	anHtmlRoot link
		relationship: 'icon';
		type: 'image/png';
		url: self configuration resourcesURL , '/Maquettes/images/favicon/favicon-32x32.png';
		attributeAt: 'sizes' put: '32x32'.
	anHtmlRoot link
		relationship: 'icon';
		type: 'image/png';
		url: self configuration resourcesURL , '/Maquettes/images/favicon/favicon-16x16.png';
		attributeAt: 'sizes' put: '16x16'.
	anHtmlRoot link
		relationship: 'manifest';
		url: self configuration resourcesURL , '/Maquettes/images/favicon/manifest.json'.
	anHtmlRoot link
		relationship: 'mask-icon';
		url: self configuration resourcesURL , '/Maquettes/images/favicon/safari-pinned-tab.svg';
		attributeAt: 'color' put: '#2196f3'.
	anHtmlRoot meta
		name: 'msapplication-TileColor';
		content: '#ff0000'.
	anHtmlRoot meta
		name: 'msapplication-TileImage';
		content: self configuration resourcesURL , '/Maquettes/images/favicon/mstile-144x144.png'.
	anHtmlRoot meta
		name: 'theme-color';
		content: '#ffffff'