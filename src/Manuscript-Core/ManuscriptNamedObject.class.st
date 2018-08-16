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
	nameKey := (#s, self manuscriptNameIdentifier) asSymbol.
	^(super fromDictionary: aDictionary)
		name: (aDictionary at: nameKey);
		yourself
]

{ #category : #testing }
ManuscriptNamedObject class >> isAbstract [

	^self name = #ManuscriptNamedObject
]

{ #category : #defaults }
ManuscriptNamedObject class >> manuscriptNameIdentifier [
	"By default the name identifier conforms to the id identifier"

	^self manuscriptIdentifier 
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
