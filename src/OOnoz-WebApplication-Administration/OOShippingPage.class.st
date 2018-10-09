Class {
	#name : #OOShippingPage,
	#superclass : #OOPage,
	#category : 'OOnoz-WebApplication-Administration-Pages'
}

{ #category : #accessing }
OOShippingPage >> breadcrumpLabel [
	^ #Livraisons
]

{ #category : #accessing }
OOShippingPage >> description [
	^ 'Vous trouverez sur cette page les informations des utilisateurs à qui vous devez livrer des cadeaux.'
]

{ #category : #accessing }
OOShippingPage >> moduleName [
	^ #shipping
]

{ #category : #rendering }
OOShippingPage >> renderComponentOn: html [
	html
		tbsContainer: [ | mcqs |
			(mcqs := self currentUser mcqs select: #hasGift)
				ifEmpty: [ self renderEmptyContentOn: html ]
				ifNotEmpty: [ self renderPanelsFor: mcqs on: html ] ]
]

{ #category : #rendering }
OOShippingPage >> renderEmptyContentOn: html [
	html tbsRow
		class: #'text-center';
		with: [ html tbsAlert
				beWarning;
				with: 'Aucun cadeau à livrer.' ]
]

{ #category : #rendering }
OOShippingPage >> renderPanelsFor: aCollectionOfMCQs on: html [
	html
		tbsPanelGroupId: #mcqsList
		with: [ aCollectionOfMCQs
				doWithIndex: [ :mcq :i | 
					html tbsArticlePanel
						beDefault;
						with: [ html render: (OOShippingMCQComponent mcq: mcq index: i) ] ] ]
]

{ #category : #accessing }
OOShippingPage >> title [
	^ 'Liste des gagnants de cadeaux'
]
