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

{ #category : #creational }
ManuscriptClient >> createNewCase: aManuscriptCase [

	| rawResult |
	rawResult := self executeCommand: (ManuscriptCreateNewCaseCommand token: token on: aManuscriptCase).
	(rawResult at: #errorCode)
		ifNil: [ ^ self ].
	
	self error: ((rawResult at: #errors) first at: #message)
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

{ #category : #listing }
ManuscriptClient >> listAreas [
	
	^self queryListUsing: ManuscriptListAreasCommand new
]

{ #category : #listing }
ManuscriptClient >> listCategories [
	
	^self queryListUsing: ManuscriptListCategoriesCommand new
]

{ #category : #listing }
ManuscriptClient >> listMilestones [
	
	^self queryListUsing: ManuscriptListMilestonesCommand new
]

{ #category : #listing }
ManuscriptClient >> listPriorities [

	^self queryListUsing: ManuscriptListPrioritiesCommand new
]

{ #category : #listing }
ManuscriptClient >> listProjects [
	
	^self queryListUsing: ManuscriptListProjectsCommand new
]

{ #category : #listing }
ManuscriptClient >> listStatuses [

	^self queryListUsing: ManuscriptListStatusesCommand new
]

{ #category : #listing }
ManuscriptClient >> listTags [

	^self queryListUsing: ManuscriptListTagsCommand new
]

{ #category : #listing }
ManuscriptClient >> listUsers [

	^self queryListUsing: ManuscriptListUsersCommand new
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
	(res at: #errorCode) isNil
		ifTrue: [ token := nil.
			^ self ].
	self readErrorsFrom: res
]

{ #category : #interacting }
ManuscriptClient >> query: aString [
	^ self
		queryResultOf: (ManuscriptSearchCommand query: aString)
		retrieving: #cases
		fromType: ManuscriptCase
]

{ #category : #'private - utilities' }
ManuscriptClient >> queryListUsing: aManuscriptListCommand [
	
	^self queryResultOf: aManuscriptListCommand retrieving: aManuscriptListCommand collectionID  fromType: aManuscriptListCommand modelClass 
]

{ #category : #interacting }
ManuscriptClient >> queryResultOf: command retrieving: aSymbol fromType: aClass [
	| res |
	res := self executeCommand: command.
	(res at: #errorCode)
		ifNil: [ (res at: #data)
				ifNotEmpty: [ :c | ^ (c at: aSymbol) collect: [ :each | aClass fromDictionary: each ] ] ].
	^ #()
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
