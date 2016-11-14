rendering
renderInfosOn: html
	self flag: #todo.	"image"
	html
		section: [ html
				tbsRow: [ html tbsColumn
						extraSmallSize: 3;
						with: [ html image
								class: #'img-responsive';
								url: 'http://static.wamiz.fr/images/news/medium/acheter-jouet-pour-chat-pas-cher.jpg' ].
					html tbsColumn
						extraSmallSize: 9;
						with: [ html article: [ html render: (OOMCQHeaderComponent mcq: self mcq) ].
							html
								section: [ html
										paragraph:
											(self mcq description isEmptyOrNil
												ifTrue: [ 'Le créateur du QCM n''a pas fourni de descrption pour ce QCM.' ]) ] ] ] ]