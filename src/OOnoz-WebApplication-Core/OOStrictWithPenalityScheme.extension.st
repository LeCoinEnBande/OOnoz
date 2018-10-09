Extension { #name : #OOStrictWithPenalityScheme }

{ #category : #'*OOnoz-WebApplication-Core' }
OOStrictWithPenalityScheme class >> description [
	^ 'L''utilisateur marque des points sur les questions uniquement si toutes les réponses sont juste. Autrement il perd des points. Si une réponse fausse a été cochée ou qu''une réponse juste n''a pas été cochée, l''utilisateur perdre alors un point.'
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOStrictWithPenalityScheme class >> label [
	^ 'Conformité stricte avec pénalité'
]
