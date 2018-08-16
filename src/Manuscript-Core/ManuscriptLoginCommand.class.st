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

{ #category : #accessing }
ManuscriptLoginCommand >> email [
	^ email
]

{ #category : #accessing }
ManuscriptLoginCommand >> email: anObject [
	email := anObject
]

{ #category : #accessing }
ManuscriptLoginCommand >> password [
	^ password
]

{ #category : #accessing }
ManuscriptLoginCommand >> password: anObject [
	password := anObject
]

{ #category : #printing }
ManuscriptLoginCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "logon","email": "<1s>","password": "<2s>"}' expandMacrosWith: email with: password)
]
