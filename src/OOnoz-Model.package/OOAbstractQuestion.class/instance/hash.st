comparing
hash
	^ ((self species hash + self description hash) hashMultiply + self answers hash)
		hashMultiply