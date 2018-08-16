"
List available areas
"
Class {
	#name : #ManuscriptListAreasCommand,
	#superclass : #ManuscriptListCommand,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #defaults }
ManuscriptListAreasCommand >> collectionID [

	^#areas
]

{ #category : #defaults }
ManuscriptListAreasCommand >> commandID [

	^'listAreas'
]

{ #category : #defaults }
ManuscriptListAreasCommand >> modelClass [

	^ManuscriptArea 
]
