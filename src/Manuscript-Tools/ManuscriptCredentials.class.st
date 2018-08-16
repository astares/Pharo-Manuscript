"
Credentials for the Pharo issue tracker. Take care they are stored in image
"
Class {
	#name : #ManuscriptCredentials,
	#superclass : #Object,
	#instVars : [
		'username',
		'password'
	],
	#category : #'Manuscript-Tools-Security'
}

{ #category : #initialization }
ManuscriptCredentials >> initialize [
	super initialize.
	self 
		username: '';
		password: ''
]

{ #category : #accessing }
ManuscriptCredentials >> password [
	^ password
]

{ #category : #accessing }
ManuscriptCredentials >> password: anObject [
	password := anObject
]

{ #category : #accessing }
ManuscriptCredentials >> username [
	^username 
]

{ #category : #accessing }
ManuscriptCredentials >> username: anObject [
	username := anObject
]
