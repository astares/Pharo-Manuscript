"
A fogbugz API command
"
Class {
	#name : #ManuscriptCommand,
	#superclass : #Object,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #testing }
ManuscriptCommand class >> isAbstract [

	^self name = #ManuscriptCommand
]

{ #category : #testing }
ManuscriptCommand >> requiresSession [

	^false
]
