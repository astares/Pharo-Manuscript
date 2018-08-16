Class {
	#name : #ManuscriptListStatusesCommand,
	#superclass : #ManuscriptListCommand,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #defaults }
ManuscriptListStatusesCommand >> collectionID [

	^#statuses
]

{ #category : #defaults }
ManuscriptListStatusesCommand >> commandID [

	^'listStatuses'
]

{ #category : #defaults }
ManuscriptListStatusesCommand >> modelClass [

	^ManuscriptStatus
]
