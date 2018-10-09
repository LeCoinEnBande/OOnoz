Extension { #name : #OOPenalityScheme }

{ #category : #'*OOnoz-WebApplication-Core' }
OOPenalityScheme class >> description [
	^ 'L''utilisateur marque des points sur les questions uniquement si toutes les réponses sont juste. Si une réponse fausse a été cochée alors l''utilisateur perdra un point. Si une réponse juste n''a pas été cochée, l''utilisateur ne marquera pas de point.'
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOPenalityScheme class >> label [
	^ 'Conformité relative'
]
