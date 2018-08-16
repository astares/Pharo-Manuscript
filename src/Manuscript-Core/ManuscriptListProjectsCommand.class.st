"
List all projects 
"
Class {
	#name : #ManuscriptListProjectsCommand,
	#superclass : #ManuscriptListCommand,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #defaults }
ManuscriptListProjectsCommand >> collectionID [

	^#projects
]

{ #category : #defaults }
ManuscriptListProjectsCommand >> commandID [

	^'listProjects'
]

{ #category : #defaults }
ManuscriptListProjectsCommand >> modelClass [

	^ManuscriptProject
]
