Class {
	#name : #ManuscriptListTagsCommand,
	#superclass : #ManuscriptListCommand,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #defaults }
ManuscriptListTagsCommand >> collectionID [

	^#tags
]

{ #category : #defaults }
ManuscriptListTagsCommand >> commandID [

	^'listTags'
]

{ #category : #defaults }
ManuscriptListTagsCommand >> modelClass [

	^ManuscriptTag 
]
