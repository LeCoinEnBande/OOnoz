rendering
renderInfosOn: html
	self flag: #todo.	"image"
	html
		section: [ html
				tbsRow: [ html tbsColumn
						extraSmallSize: 3;
						with: [ html image
								class: #'img-responsive';
								url: 'https://static.fermedebeaumont.com/images/poules-coqs-race/poules-pondeuses-fermieres/poule-pondeuse-fermiere-rousse-elevage-vente.jpg' ].
					html tbsColumn
						extraSmallSize: 9;
						with: [ html article: [ html render: (OOMCQHeaderComponent mcq: self mcq) ].
							html
								section: [ html
										paragraph:
											(self mcq description isEmptyOrNil
												ifTrue: [ 'Le créateur du QCM n''a pas fourni de descrption pour ce QCM.' ]) ] ] ] ]