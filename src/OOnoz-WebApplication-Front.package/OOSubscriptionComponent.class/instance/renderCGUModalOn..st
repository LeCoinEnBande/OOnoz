rendering
renderCGUModalOn: html
	html
		tbsModalHeader: [ html tbsModalCloseIcon ariaLabel: 'Close'.
			html tbsModalTitle level3 with: 'Conditions générales d''utilisation' ].
	html tbsModalBody: [ html text: 'Les données personnelles que vous nous communiquez seront utilisées uniquement pour vous permettre de bénéficier de nos services. Conformément à la loi Informatique et libertés du 6 janvier 1978 modifiée, vous disposez de droits d''accès, de rectification et d''opposition aux données personnelles vous concernant. Vous pouvez exercer ces droits en écrivant à l’adresse OOnoz, rue du papier, 59650 Villeneuve d''Ascq , ou sur cette page. Un justificatif d’identité pourra être demandé par voie postale à l’adresse précitée.' ].
	html
		tbsModalFooter: [ html tbsButton
				dataDismiss: 'modal';
				bePush;
				with: 'Fermer' ]