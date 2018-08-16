"
List available priorities
"
Class {
	#name : #ManuscriptListPrioritiesCommand,
	#superclass : #ManuscriptListCommand,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #defaults }
ManuscriptListPrioritiesCommand >> collectionID [

	^#priorities 
]

{ #category : #defaults }
ManuscriptListPrioritiesCommand >> commandID [

	^'listPriorities'
]

{ #category : #defaults }
ManuscriptListPrioritiesCommand >> modelClass [

	^ManuscriptPriority
]
