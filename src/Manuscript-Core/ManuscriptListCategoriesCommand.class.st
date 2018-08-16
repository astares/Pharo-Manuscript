"
List the categories
"
Class {
	#name : #ManuscriptListCategoriesCommand,
	#superclass : #ManuscriptListCommand,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #defaults }
ManuscriptListCategoriesCommand >> collectionID [

	^#categories
]

{ #category : #defaults }
ManuscriptListCategoriesCommand >> commandID [

	^'listCategories'
]

{ #category : #defaults }
ManuscriptListCategoriesCommand >> modelClass [
	^ManuscriptCategory
]
