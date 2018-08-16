"
An issue tracker user
"
Class {
	#name : #ManuscriptUser,
	#superclass : #ManuscriptNamedObject,
	#instVars : [
		'isVirtual'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptUser class >> fromDictionary: aDictionary [ 
	^(super fromDictionary: aDictionary)
		isVirtual: (aDictionary at: #fVirtual);
		yourself
]

{ #category : #'private - defaults' }
ManuscriptUser class >> manuscriptIdentifier [
	"Subclasses may override the identifier for the protocol"
	
	^'Person'
]

{ #category : #'private - defaults' }
ManuscriptUser class >> manuscriptNameIdentifier [
	
	^'FullName'
]

{ #category : #accessing }
ManuscriptUser >> isVirtual [
	^ isVirtual
]

{ #category : #accessing }
ManuscriptUser >> isVirtual: anObject [
	isVirtual := anObject
]
