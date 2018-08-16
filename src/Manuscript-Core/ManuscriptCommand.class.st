"
A fogbugz API command
"
Class {
	#name : #ManuscriptCommand,
	#superclass : #Object,
	#category : #'Manuscript-Core-Commands'
}

{ #category : #testing }
ManuscriptCommand class >> isAbstract [

	^self name = #ManuscriptCommand
]

{ #category : #conversion }
ManuscriptCommand >> asJSONString [

	^self subclassResponsibility 
]

{ #category : #printing }
ManuscriptCommand >> printOn: aStream [

	aStream
		nextPutAll: self asJSONString
]

{ #category : #testing }
ManuscriptCommand >> requiresSession [

	^false
]
