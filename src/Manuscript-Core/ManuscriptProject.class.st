"
A Manuscript project
"
Class {
	#name : #ManuscriptProject,
	#superclass : #ManuscriptObject,
	#instVars : [
		'ownerID',
		'isInbox'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptProject class >> fromDictionary: aDictionary [ 
	^(self fromDictionary: aDictionary identifier: #sProject)
		ownerID: (aDictionary at: #ixPersonOwner);
		isInbox: (aDictionary at: #fInbox)
		yourself
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
