"
A milestone
"
Class {
	#name : #ManuscriptMilestone,
	#superclass : #ManuscriptNamedObject,
	#instVars : [
		'projectId'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptMilestone class >> fromDictionary: aDictionary [ 
	
	^(super fromDictionary: aDictionary)
		projectId: (aDictionary at: #ixProject);
		yourself
]

{ #category : #'private - defaults' }
ManuscriptMilestone class >> manuscriptIdentifier [
	"Subclasses may override the identifier for the protocol"
	
	^'FixFor'
]

{ #category : #accessing }
ManuscriptMilestone >> projectId [
	^ projectId
]

{ #category : #accessing }
ManuscriptMilestone >> projectId: anObject [
	projectId := anObject
]
