"
Available status
"
Class {
	#name : #ManuscriptStatus,
	#superclass : #ManuscriptNamedObject,
	#instVars : [
		'categoryId',
		'orderIndex'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptStatus class >> fromDictionary: aDictionary [ 
	^(super fromDictionary: aDictionary)
		categoryId: (aDictionary at: #ixCategory);
		orderIndex: (aDictionary at: #iOrder);
		yourself
]

{ #category : #'private - defaults' }
ManuscriptStatus class >> manuscriptIdentifier [
	
	^'Status'
]

{ #category : #accessing }
ManuscriptStatus >> categoryId [
	^ categoryId
]

{ #category : #accessing }
ManuscriptStatus >> categoryId: anObject [
	categoryId := anObject
]

{ #category : #accessing }
ManuscriptStatus >> orderIndex [
	^ orderIndex
]

{ #category : #accessing }
ManuscriptStatus >> orderIndex: anObject [
	orderIndex := anObject
]
