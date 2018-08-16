"
List available users
"
Class {
	#name : #ManuscriptListUsersCommand,
	#superclass : #ManuscriptListCommand,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #conversion }
ManuscriptListUsersCommand >> asJSONString [

	^'{"cmd": "<1s>","token": "<2s>", "fIncludeVirtual": 1, "fIncludeNormal": 1}' expandMacrosWith: self commandID with: token asString
]

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
