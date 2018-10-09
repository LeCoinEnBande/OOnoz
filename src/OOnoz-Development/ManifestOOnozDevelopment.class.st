"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestOOnozDevelopment,
	#superclass : #PackageManifest,
	#category : 'OOnoz-Development'
}

{ #category : #'code-critics' }
ManifestOOnozDevelopment class >> ruleRBClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#OODevHelper)) #'2016-09-17T21:27:37.61227+02:00') )
]
