"
List available users
"
Class {
	#name : #ManuscriptListUsersCommand,
	#superclass : #ManuscriptListCommand,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #defaults }
ManuscriptListUsersCommand >> collectionID [

	^#people
]

{ #category : #defaults }
ManuscriptListUsersCommand >> commandID [

	^'listPeople'
]

{ #category : #defaults }
ManuscriptListUsersCommand >> modelClass [

	^ManuscriptUser
]
