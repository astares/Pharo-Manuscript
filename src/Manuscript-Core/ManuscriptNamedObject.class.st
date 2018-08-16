"
Abstract superclass for named items
"
Class {
	#name : #ManuscriptNamedObject,
	#superclass : #ManuscriptObject,
	#instVars : [
		'name'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptNamedObject class >> fromDictionary: aDictionary [ 
	
	|nameKey|
	nameKey := (#s, self manuscriptIdentifier) asSymbol.
	^(super fromDictionary: aDictionary)
		name: (aDictionary at: nameKey);
		yourself
]

{ #category : #testing }
ManuscriptNamedObject class >> isAbstract [

	^self name = #ManuscriptNamedObject
]

{ #category : #initialization }
ManuscriptNamedObject >> initialize [

	super initialize.
	self name: ''
]

{ #category : #accessing }
ManuscriptNamedObject >> name [
	^ name
]

{ #category : #accessing }
ManuscriptNamedObject >> name: anObject [
	name := anObject
]

{ #category : #printing }
ManuscriptNamedObject >> printOn: aStream [

	aStream nextPutAll: self name
]
