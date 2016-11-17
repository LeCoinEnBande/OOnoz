removing
removeDevToolbar
	| appli |
	WAAdmin disableDevelopmentTools.
	"What is following is a hack because of a seaside bug."
	(PragmaCollector filter: [ :prg | prg keyword = #oonozApplication ]) reset do: [ :prg | prg class initialize ]