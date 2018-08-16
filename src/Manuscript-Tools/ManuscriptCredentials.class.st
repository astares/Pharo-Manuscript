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

{ #category : #'instance creation' }
ManuscriptCredentials class >> username: username password: password [
	"Return a new instance of the receiver filled with the given username and password"
	
	^(self new)
		username: username;
		password: password;
		yourself
]

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
