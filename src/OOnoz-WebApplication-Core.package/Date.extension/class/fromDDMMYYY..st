*OOnoz-WebApplication-Core
fromDDMMYYY: aString
	| split |
	split := ($/ split: aString) collect: #asNumber.
	^ self year: (split at: 3) month: (split at: 2) day: (split at: 1)