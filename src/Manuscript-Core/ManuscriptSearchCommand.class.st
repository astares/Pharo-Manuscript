"
A search command
"
Class {
	#name : #ManuscriptSearchCommand,
	#superclass : #ManuscriptTokenCommand,
	#instVars : [
		'query'
	],
	#category : #'Manuscript-Core-Commands'
}

{ #category : #'instance creation' }
ManuscriptSearchCommand class >> query: query [

	^(self new)
		query: query;
		yourself
]

{ #category : #conversion }
ManuscriptSearchCommand >> asJSONString [

	^'{"cmd": "<1s>",
	 	"token": "<2s>",
		"q": "<3s>",
  		"cols": ["sTitle", "sStatus"]}' expandMacrosWith: self commandID with: token asString with: query asString
]

{ #category : #defaults }
ManuscriptSearchCommand >> commandID [

	^'search'
]

{ #category : #accessing }
ManuscriptSearchCommand >> query [
	^ query
]

{ #category : #accessing }
ManuscriptSearchCommand >> query: anObject [
	query := anObject
]
