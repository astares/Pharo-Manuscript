"
Login command
"
Class {
	#name : #ManuscriptLoginCommand,
	#superclass : #ManuscriptCommand,
	#instVars : [
		'email',
		'password'
	],
	#category : #'Manuscript-Core-Commands'
}

{ #category : #'instance creation' }
ManuscriptLoginCommand class >> loginUser: email password: password [

	^(self new)
		email: email;
		password: password;
		yourself
		
]

{ #category : #conversion }
ManuscriptLoginCommand >> asJSONString [

	^'{"cmd": "logon","email": "<1s>","password": "<2s>"}' expandMacrosWith: email with: password 
]

{ #category : #accessing }
ManuscriptLoginCommand >> email [
	^ email
]

{ #category : #accessing }
ManuscriptLoginCommand >> email: anObject [
	email := anObject
]

{ #category : #initialization }
ManuscriptLoginCommand >> initialize [

	super initialize.
	self 
		email: '';
		password: ''
]

{ #category : #accessing }
ManuscriptLoginCommand >> password [
	^ password
]

{ #category : #accessing }
ManuscriptLoginCommand >> password: anObject [
	password := anObject
]
