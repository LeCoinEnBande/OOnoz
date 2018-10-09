Class {
	#name : #OORechargePage,
	#superclass : #OOPage,
	#category : 'OOnoz-WebApplication-Front-Pages'
}

{ #category : #accessing }
OORechargePage >> breadcrumpLabel [
	^ #Rechargement
]

{ #category : #accessing }
OORechargePage >> description [
	^ 'Cet écran vous permet de recharger vos crédits.'
]

{ #category : #accessing }
OORechargePage >> moduleName [
	^ #recharge
]

{ #category : #rendering }
OORechargePage >> renderComponentOn: html [
	html
		tbsContainer: [ html
				tbsRow: [ html
						tbsColMs: 8
						mo: 2
						with: [ html tbsLabel
								bePrimary;
								with: 'Nombre de crédits restant: ' , self currentUser credits asString ] ].
			html tbsRow: [ html tbsColMs: 8 mo: 2 with: [ self renderFormOn: html ] ] ]
]

{ #category : #rendering }
OORechargePage >> renderFormOn: html [
	html
		article: [ html tbsArticlePanelHeader
				with: [ html tbsPanelTitle
						level2;
						with: [ html text: #Rechargement ] ].
			html
				form: [ html section
						class: #'panel-body';
						with: [ html
								tbsFormGroup: [ html label
										for: html nextId;
										with: 'Montant à recharger'.
									html numberInput
										tbsFormControl;
										value: 5;
										callback: [ :i | self currentUser addCredits: i asInteger ] ] ].
					html
						tbsArticlePanelFooter: [ html tbsSubmitButton
								role: #button;
								bePrimary;
								with: 'Recharger' ] ] ]
]

{ #category : #accessing }
OORechargePage >> title [
	^ ''
]
