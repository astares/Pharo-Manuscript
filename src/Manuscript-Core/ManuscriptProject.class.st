"
A Manuscript project
"
Class {
	#name : #ManuscriptProject,
	#superclass : #ManuscriptNamedObject,
	#instVars : [
		'ownerID',
		'isInbox'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptProject class >> fromDictionary: aDictionary [ 
	^(super fromDictionary: aDictionary)
		name: (aDictionary at: #sProject);
		ownerID: (aDictionary at: #ixPersonOwner);
		isInbox: (aDictionary at: #fInbox)
		yourself
]

{ #category : #'private - defaults' }
ManuscriptProject class >> manuscriptIdentifier [

	^'Project'
]

{ #category : #accessing }
ManuscriptProject >> isInbox [
	^ isInbox
]

{ #category : #accessing }
ManuscriptProject >> isInbox: anObject [
	isInbox := anObject
]

{ #category : #accessing }
ManuscriptProject >> ownerID [
	^ ownerID
]

{ #category : #accessing }
ManuscriptProject >> ownerID: anObject [
	ownerID := anObject
]
