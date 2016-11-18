comparing
hash
	^ ((((self species hash + self questions hash) hashMultiply + self title hash) hashMultiply + self description hash) hashMultiply
		+ self orderer hash) hashMultiply