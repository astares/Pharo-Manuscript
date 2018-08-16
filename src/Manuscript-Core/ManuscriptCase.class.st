"
A case in FogBugz
"
Class {
	#name : #ManuscriptCase,
	#superclass : #ManuscriptObject,
	#instVars : [
		'title',
		'status'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptCase class >> fromDictionary: aDictionary [ 
	|case|
	case := self fromDictionary: aDictionary identifier: #ixBug.
	case 
		title: (aDictionary at: #sTitle);
		status: (aDictionary at: #sStatus) asSymbol.
	^case
]

{ #category : #conversion }
ManuscriptCase >> asURL [
	^'https://pharo.manuscript.com/f/cases/', self id asString
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
