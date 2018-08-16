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

{ #category : #'private - instance creation' }
ManuscriptObject class >> fromDictionary: aCollection identifier: aString [
	^(self new)
		id: (aCollection at: aString);
		yourself
]

{ #category : #testing }
ManuscriptObject class >> isAbstract [

	^self name = #ManuscriptObject
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
