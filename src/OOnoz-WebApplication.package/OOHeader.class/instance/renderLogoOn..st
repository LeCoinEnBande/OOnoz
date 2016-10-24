rendering
renderLogoOn: html
	html tbsNavbarBrand
		url: '#';
		with: [ html image
				altText: 'OOnoz';
				url: self resourcesURL , '/images/logo_min.png' ]