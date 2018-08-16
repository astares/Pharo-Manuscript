"
A tag
"
Class {
	#name : #ManuscriptTag,
	#superclass : #ManuscriptNamedObject,
	#category : #'Manuscript-Core-Model'
}

{ #category : #'private - defaults' }
ManuscriptTag class >> manuscriptIdentifier [
	"Subclasses may override the identifier for the protocol"
	
	^'Tag'
]
