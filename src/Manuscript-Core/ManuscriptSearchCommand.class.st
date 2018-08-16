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

{ #category : #printing }
ManuscriptSearchCommand >> printOn: aStream [

	aStream
		nextPutAll:
			('{"cmd": "search",
			   "token": "<1s>",
			   "q": "<2s>",
    			"cols": ["sTitle", "sStatus"]
			}' expandMacrosWith: token asString with: query asString)
]

{ #category : #accessing }
ManuscriptSearchCommand >> query [
	^ query
]

{ #category : #accessing }
ManuscriptSearchCommand >> query: anObject [
	query := anObject
]
