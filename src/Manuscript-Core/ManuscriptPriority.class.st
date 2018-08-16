"
A priority
"
Class {
	#name : #ManuscriptPriority,
	#superclass : #ManuscriptNamedObject,
	#instVars : [
		'isDefault'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptPriority class >> fromDictionary: aDictionary [ 
	
	^(super fromDictionary: aDictionary)
		isDefault: (aDictionary at: #fDefault);
		yourself
]

{ #category : #'private - defaults' }
ManuscriptPriority class >> manuscriptIdentifier [
	"Subclasses may override the identifier for the protocol"
	
	^'Priority'
]

{ #category : #accessing }
ManuscriptPriority >> isDefault [
	^ isDefault
]

{ #category : #accessing }
ManuscriptPriority >> isDefault: anObject [
	isDefault := anObject
]
