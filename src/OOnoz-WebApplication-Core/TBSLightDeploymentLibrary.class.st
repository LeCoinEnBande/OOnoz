"
I am a subclass of the bootstrap library to reject some files.
"
Class {
	#name : #TBSLightDeploymentLibrary,
	#superclass : #TBSDeploymentLibrary,
	#category : 'OOnoz-WebApplication-Core'
}

{ #category : #accessing }
TBSLightDeploymentLibrary >> selectorsToInclude [
	^ #(cssbootstrapminCss jsbootstrapminJs holderminJs)
]
