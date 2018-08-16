"
A case in FogBugz
"
Class {
	#name : #ManuscriptCase,
	#superclass : #Object,
	#instVars : [
		'id',
		'title',
		'status'
	],
	#category : #'Manuscript-Core-Model'
}

{ #category : #'instance creation' }
ManuscriptCase class >> fromDictionary: aCollection [ 
	|case|
	case := self new.
	case 
		id: (aCollection at: #ixBug) asNumber;
		title: (aCollection at: #sTitle);
		status: (aCollection at: #sStatus) asSymbol.
	^case
]

{ #category : #comparision }
ManuscriptCase >> <= anotherCase [

	^self id <= anotherCase id
]

{ #category : #conversion }
ManuscriptCase >> asURL [
	^'https://pharo.manuscript.com/f/cases/', self id asString
]

{ #category : #comparision }
ManuscriptCase >> hash [
	self id ifNil: [ ^super hash ].
	^self id hash
]

{ #category : #accessing }
ManuscriptCase >> id [

	^id
]

{ #category : #accessing }
ManuscriptCase >> id: aNumber [
	id := aNumber
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
