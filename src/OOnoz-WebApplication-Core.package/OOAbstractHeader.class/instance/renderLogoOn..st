rendering
renderLogoOn: html
	self flag: #todo.	"use Logo"
	html tbsNavbarBrand
		url: '#';
		with: #OOnoz	"[ html image
				altText: 'OOnoz';
				url: self resourcesURL , '/images/logo_min.png' ]"