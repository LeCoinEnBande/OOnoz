instance creation
newInstance
	^ self actualClass new
		firstName: 'Aurélien';
		lastName: 'Rousseau';
		mail: 'pingu@gmail.com';
		password: 'ATestPass012#';
		birthday: (Date year: 1990 month: 01 day: 01);
		beOtherGender;
		country: 'France';
		state: 'Hauts-de-France';
		city: 'Lille';
		zip: '59000';
		address: '01 rue Jean Jaures';
		yourself