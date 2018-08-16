"
An area
"
Class {
	#name : #ManuscriptArea,
	#superclass : #ManuscriptNamedObject,
	#instVars : [
		'projectId'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptArea class >> fromDictionary: aDictionary [ 
	
	^(super fromDictionary: aDictionary)
		projectId: (aDictionary at: #ixProject);
		yourself
]

{ #category : #'private - defaults' }
ManuscriptArea class >> manuscriptIdentifier [
	
	^'Area'
]

{ #category : #accessing }
ManuscriptArea >> projectId [
	^ projectId
]

{ #category : #accessing }
ManuscriptArea >> projectId: anObject [
	projectId := anObject
]
