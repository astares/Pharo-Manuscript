"
List available Milestones
"
Class {
	#name : #ManuscriptListMilestonesCommand,
	#superclass : #ManuscriptListCommand,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #defaults }
ManuscriptListMilestonesCommand >> collectionID [

	^#fixfors
]

{ #category : #defaults }
ManuscriptListMilestonesCommand >> commandID [

	^'listFixFors'
]

{ #category : #defaults }
ManuscriptListMilestonesCommand >> modelClass [

	^ManuscriptMilestone
]
