comparing
hash
	^ ((self species hash + self description hash) hashMultiply + self title hash) hashMultiply