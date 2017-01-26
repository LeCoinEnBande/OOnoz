*OOnoz-WebApplication-Front
renderForSearchOn: html
	html figure
		class: 'thumbnail';
		class: 'grid-item';
		with:
				[ html image url: 'http://baconmockup.com/' , (300 to: 400) atRandom asString , '/200/'.	"self themeMediaUrl"
			html
				figureCaption: [ html heading
						level3;
						with: self title.
					html paragraph: self description ] ]