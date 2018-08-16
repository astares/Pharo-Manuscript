"
A client for Pharo Fogbugz issue server.

https://pharo.fogbugz.com/f/

See class side example methods
"
Class {
	#name : #ManuscriptClient,
	#superclass : #Object,
	#instVars : [
		'token',
		'errors'
	],
	#category : #'Manuscript-Core-Base'
}

{ #category : #examples }
ManuscriptClient class >> example [
	
	|client|
	client := ManuscriptClient loginUser: 'abc@def.com' password: 'secret'.
	(client query: 'UFFI') inspect.
	client logout
]

{ #category : #'instance creation' }
ManuscriptClient class >> loginUser: email password: password [

	^(self new)
		login: email password: password;
		yourself
]

{ #category : #'private - accessing' }
ManuscriptClient >> errors [

	^errors 
]

{ #category : #'private - utilities' }
ManuscriptClient >> executeCommand: aCommand [
	errors := nil.
	aCommand requiresSession ifTrue: [ 
		aCommand token: token ].
	^ STON
		fromString:
			(ZnClient new
				post: self jsonAPILocation
				contents: aCommand printString)
]

{ #category : #testing }
ManuscriptClient >> isLoggedIn [

	^token notNil
]

{ #category : #'private - accessing' }
ManuscriptClient >> jsonAPILocation [
	^'https://pharo.manuscript.com/f/api/0/jsonapi'
]

{ #category : #interacting }
ManuscriptClient >> listProjects [
	
	^self queryResultOf: ManuscriptListProjectsCommand new retrieving: #projects fromType: ManuscriptProject
]

{ #category : #private }
ManuscriptClient >> login: email password: password [
	| ston |
	ston := self
		executeCommand: (ManuscriptLoginCommand loginUser: email password: password).
	(ston at: #data)
		ifEmpty: [ self readErrorsFrom: ston ]
		ifNotEmpty: [ :x | token := x at: #token ]
]

{ #category : #authentication }
ManuscriptClient >> logout [

	| res |
	res := self executeCommand: ManuscriptLogoutCommand new.
	(res at: #errorCode) isNil ifTrue: [token := nil. ^self].
	self readErrorsFrom: res
]

{ #category : #interacting }
ManuscriptClient >> query: aString [
	
	^self queryResultOf: (ManuscriptSearchCommand query: aString) retrieving: #cases fromType: ManuscriptCase
]

{ #category : #interacting }
ManuscriptClient >> queryResultOf: command retrieving: aSymbol fromType: aClass [

	| res |
	res := self executeCommand: command.
   (res at: #errorCode) ifNil: [
		(res at: #data) ifNotEmpty: [:c |
			^(c at: aSymbol) 
				collect: [:each | aClass fromDictionary: each ]]].
	^#()
]

{ #category : #'private - utilities' }
ManuscriptClient >> readErrorsFrom: ston [
	errors := (ston at: #errors) collect: [ :each | each at: #message ]
]

{ #category : #accessing }
ManuscriptClient >> summarizedErrors [

	^String streamContents: [:s | 
		self errors do: [:each | s nextPutAll: each; cr ]	]
]
