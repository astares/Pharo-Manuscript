"
A priority
"
Class {
	#name : #ManuscriptPriority,
	#superclass : #ManuscriptNamedObject,
	#category : #'Manuscript-Core-Model'
}

{ #category : #'private - defaults' }
ManuscriptPriority class >> manuscriptIdentifier [
	"Subclasses may override the identifier for the protocol"
	
	^'Priority'
]
