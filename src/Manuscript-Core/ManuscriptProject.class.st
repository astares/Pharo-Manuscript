"
A Manuscript project
"
Class {
	#name : #ManuscriptProject,
	#superclass : #ManuscriptNamedObject,
	#instVars : [
		'defaultAssigneeId',
		'isInbox'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptProject class >> fromDictionary: aDictionary [ 
	^(super fromDictionary: aDictionary)		
		defaultAssigneeId: (aDictionary at: #ixPersonOwner);
		isInbox: (aDictionary at: #fInbox)
		yourself
]

{ #category : #'private - defaults' }
ManuscriptProject class >> manuscriptIdentifier [

	^'Project'
]

{ #category : #accessing }
ManuscriptProject >> defaultAssigneeId [
	^ defaultAssigneeId
]

{ #category : #accessing }
ManuscriptProject >> defaultAssigneeId: anObject [
	defaultAssigneeId := anObject
]

{ #category : #accessing }
ManuscriptProject >> isInbox [
	^ isInbox
]

{ #category : #accessing }
ManuscriptProject >> isInbox: anObject [
	isInbox := anObject
]
