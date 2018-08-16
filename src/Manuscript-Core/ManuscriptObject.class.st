"
Common superclass for Manuscript objects
"
Class {
	#name : #ManuscriptObject,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptObject class >> fromDictionary: aCollection [
	|idKey|
	idKey := ('ix', self manuscriptIdentifier) asSymbol. 
	^(self new)
		id: (aCollection at: idKey) ;
		yourself
]

{ #category : #testing }
ManuscriptObject class >> isAbstract [

	^self name = #ManuscriptObject
]

{ #category : #'private - defaults' }
ManuscriptObject class >> manuscriptIdentifier [
	"Subclasses may override the identifier for the protocol"
	
	^self subclassResponsibility 
]

{ #category : #comparision }
ManuscriptObject >> <= anotherObject [

	^self id <= anotherObject id
]

{ #category : #comparision }
ManuscriptObject >> hash [
	self id ifNil: [ ^super hash ].
	^self id hash
]

{ #category : #accessing }
ManuscriptObject >> id [

	^id
]

{ #category : #accessing }
ManuscriptObject >> id: aNumber [
	id := aNumber
]
