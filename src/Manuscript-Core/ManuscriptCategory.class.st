"
A category
"
Class {
	#name : #ManuscriptCategory,
	#superclass : #ManuscriptNamedObject,
	#instVars : [
		'defaultStatusId',
		'defaultStatusIdWhenActive'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptCategory class >> fromDictionary: aDictionary [ 
	
	^(super fromDictionary: aDictionary)
		defaultStatusId: (aDictionary at: #ixStatusDefault);
		defaultStatusIdWhenActive: (aDictionary at: #ixStatusDefaultActive);
		yourself
]

{ #category : #'private - defaults' }
ManuscriptCategory class >> manuscriptIdentifier [
	
	^'Category'
]

{ #category : #accessing }
ManuscriptCategory >> defaultStatusId [
	^ defaultStatusId
]

{ #category : #accessing }
ManuscriptCategory >> defaultStatusId: anObject [
	defaultStatusId := anObject
]

{ #category : #accessing }
ManuscriptCategory >> defaultStatusIdWhenActive [
	^ defaultStatusIdWhenActive
]

{ #category : #accessing }
ManuscriptCategory >> defaultStatusIdWhenActive: anObject [
	defaultStatusIdWhenActive := anObject
]
