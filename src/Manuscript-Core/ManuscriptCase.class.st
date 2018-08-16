"
A case in FogBugz
"
Class {
	#name : #ManuscriptCase,
	#superclass : #ManuscriptObject,
	#instVars : [
		'title',
		'status',
		'content',
		'project',
		'category',
		'area',
		'milestone',
		'assignee',
		'priority'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptCase class >> fromDictionary: aDictionary [ 
	|case|
	case := super fromDictionary: aDictionary.
	case 
		title: (aDictionary at: #sTitle);
		status: (aDictionary at: #sStatus) asSymbol.
	^case
]

{ #category : #'private - defaults' }
ManuscriptCase class >> manuscriptIdentifier [

	^'Bug'
]

{ #category : #accessing }
ManuscriptCase >> area [
	^ area
]

{ #category : #accessing }
ManuscriptCase >> area: anObject [
	area := anObject
]

{ #category : #conversion }
ManuscriptCase >> asURL [
	^'https://pharo.manuscript.com/f/cases/', self id asString
]

{ #category : #accessing }
ManuscriptCase >> assignee [
	^ assignee
]

{ #category : #accessing }
ManuscriptCase >> assignee: anObject [
	assignee := anObject
]

{ #category : #accessing }
ManuscriptCase >> category [
	^ category
]

{ #category : #accessing }
ManuscriptCase >> category: anObject [
	category := anObject
]

{ #category : #accessing }
ManuscriptCase >> content [
	^ content
]

{ #category : #accessing }
ManuscriptCase >> content: anObject [
	content := anObject
]

{ #category : #accessing }
ManuscriptCase >> milestone [
	^ milestone
]

{ #category : #accessing }
ManuscriptCase >> milestone: anObject [
	milestone := anObject
]

{ #category : #printing }
ManuscriptCase >> printOn: aStream [

	aStream 
		nextPutAll: self id asString;
		nextPutAll: ' - ';
		nextPutAll: self title asString
]

{ #category : #accessing }
ManuscriptCase >> priority [
	^ priority
]

{ #category : #accessing }
ManuscriptCase >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
ManuscriptCase >> project [
	^ project
]

{ #category : #accessing }
ManuscriptCase >> project: anObject [
	project := anObject
]

{ #category : #accessing }
ManuscriptCase >> status [

	^status
]

{ #category : #accessing }
ManuscriptCase >> status: aSymbol [

	status := aSymbol
]

{ #category : #accessing }
ManuscriptCase >> title [

	^title
]

{ #category : #accessing }
ManuscriptCase >> title: aString [ 

	title := aString
]
