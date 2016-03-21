"
A case in FogBugz
"
Class {
	#name : #FogBugzCase,
	#superclass : #Object,
	#instVars : [
		'id',
		'title',
		'status'
	],
	#category : #'FogBugz-Core-Model'
}

{ #category : #'instance creation' }
FogBugzCase class >> fromDictionary: aCollection [ 
	|case|
	case := self new.
	case 
		id: (aCollection at: #ixBug);
		title: (aCollection at: #sTitle);
		status: (aCollection at: #sStatus) asSymbol.
	^case
]

{ #category : #conversion }
FogBugzCase >> asURL [
	^'https://pharo.fogbugz.com/f/cases/', self id asString
]

{ #category : #accessing }
FogBugzCase >> id [

	^id
]

{ #category : #accessing }
FogBugzCase >> id: aNumber [
	id := aNumber
]

{ #category : #printing }
FogBugzCase >> printOn: aStream [

	aStream 
		nextPutAll: self id asString;
		nextPutAll: ' - ';
		nextPutAll: self title asString
]

{ #category : #accessing }
FogBugzCase >> status [

	^status
]

{ #category : #accessing }
FogBugzCase >> status: aSymbol [
	status := aSymbol
]

{ #category : #accessing }
FogBugzCase >> title [

	^title
]

{ #category : #accessing }
FogBugzCase >> title: aString [ 

	title := aString
]
