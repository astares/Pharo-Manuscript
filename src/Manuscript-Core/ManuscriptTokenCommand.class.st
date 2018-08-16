"
A command with a session command
"
Class {
	#name : #ManuscriptTokenCommand,
	#superclass : #ManuscriptCommand,
	#instVars : [
		'token'
	],
	#category : #'Manuscript-Core-Commands'
}

{ #category : #testing }
ManuscriptTokenCommand class >> isAbstract [

	^self name = #ManuscriptTokenCommand
]

{ #category : #'instance creation' }
ManuscriptTokenCommand class >> token: aToken [
	"Return a new instance of the receiver using the given token string"
	
	^(self new) 
		token: aToken;
		yourself
]

{ #category : #conversion }
ManuscriptTokenCommand >> asJSONString [

	^'{"cmd": "<1s>","token": "<2s>"}' expandMacrosWith: self commandID with: token asString
]

{ #category : #defaults }
ManuscriptTokenCommand >> commandID [

	^self subclassResponsibility 
]

{ #category : #initialization }
ManuscriptTokenCommand >> initialize [
	super initialize.
	self token: ''
]

{ #category : #testing }
ManuscriptTokenCommand >> requiresSession [

	^true
]

{ #category : #accessing }
ManuscriptTokenCommand >> token [
	^ token
]

{ #category : #accessing }
ManuscriptTokenCommand >> token: anObject [
	token := anObject
]
