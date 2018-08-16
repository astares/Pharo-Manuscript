"
Abstract superclass for list commands
"
Class {
	#name : #ManuscriptListCommand,
	#superclass : #ManuscriptTokenCommand,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #testing }
ManuscriptListCommand class >> isAbstract [

	^self name = #ManuscriptListCommand
]
