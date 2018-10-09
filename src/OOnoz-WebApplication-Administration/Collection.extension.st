Extension { #name : #Collection }

{ #category : #'*OOnoz-WebApplication-Administration' }
Collection >> average: aSymbolOrBlock [
	^ (self sum: aSymbolOrBlock) / self size
]
