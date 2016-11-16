*OOnoz-WebApplication-Core
genders
	| dico |
	dico := Dictionary new.
	self possibleGenders do: [ :each | dico at: each put: #Indefinit ].
	dico at: #male put: #Homme.
	dico at: #female put: #Femme.
	dico at: #other put: #Autre.
	^ dico