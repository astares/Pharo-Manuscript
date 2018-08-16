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
