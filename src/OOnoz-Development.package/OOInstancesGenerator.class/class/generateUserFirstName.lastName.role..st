helpers
generateUserFirstName: first lastName: last role: role
	| city |
	city := self randomCity.
	^ OOUser new
		firstName: first;
		lastName: last;
		mail: (first , '.' , last , '@gmail.com') asLowercase;
		password: 'JeSuis' , first , '1';
		birthday: OOInstancesGenerator generateNewBirthdayDate;
		gender: OOUser possibleGenders atRandom;
		country: 'France';
		state: OOInstancesGenerator randomStates;
		zip: (city := OOInstancesGenerator randomCity) value;
		city: city key;
		role: (role ifNil: [ OOPlayerRole ]);
		credits: (5 to: 100) atRandom;
		address: '13 rue du Templier';
		isActivated: #(true false true true) atRandom;
		hasAvatar: false;
		yourself