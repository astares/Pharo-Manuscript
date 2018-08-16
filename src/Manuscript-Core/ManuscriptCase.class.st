"
A case in FogBugz
"
Class {
	#name : #ManuscriptCase,
	#superclass : #ManuscriptObject,
	#instVars : [
		'title',
		'status',
		'content'
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

{ #category : #conversion }
ManuscriptCase >> asURL [
	^'https://pharo.manuscript.com/f/cases/', self id asString
]

{ #category : #accessing }
ManuscriptCase >> content [
	^ content
]

{ #category : #accessing }
ManuscriptCase >> content: anObject [
	content := anObject
]

{ #category : #printing }
ManuscriptCase >> printOn: aStream [

	aStream 
		nextPutAll: self id asString;
		nextPutAll: ' - ';
		nextPutAll: self title asString
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
