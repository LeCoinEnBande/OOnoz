Class {
	#name : #OOSubscriptionPage,
	#superclass : #OOPage,
	#instVars : [
		'subscriptionComp'
	],
	#category : 'OOnoz-WebApplication-Front-Pages'
}

{ #category : #accessing }
OOSubscriptionPage >> breadcrumpLabel [
	^ #Inscription
]

{ #category : #accessing }
OOSubscriptionPage >> description [
	^ ''
]

{ #category : #accessing }
OOSubscriptionPage >> moduleName [
	^ #profile
]

{ #category : #rendering }
OOSubscriptionPage >> renderComponentOn: html [
	html render: self subscriptionComp
]

{ #category : #accessing }
OOSubscriptionPage >> subscriptionComp [
	^ subscriptionComp ifNil: [ subscriptionComp := OOSubscriptionComponent new ]
]

{ #category : #accessing }
OOSubscriptionPage >> title [
	^ ''
]
