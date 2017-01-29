accessing
entitiesCached
	^ entitiesCached ifNil: [ entitiesCached := self computeEntitiesToShow ]