"
Unit tests for ManuscriptLogoutCommand
"
Class {
	#name : #ManuscriptLogoutCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'Manuscript-Tests-Core-Commands'
}

{ #category : #running }
ManuscriptLogoutCommandTest >> setUp [

	super setUp.
	command := ManuscriptLogoutCommand new token: 'pljl6316cjgv5h3cnmntbck295gf47'
]

{ #category : #tests }
ManuscriptLogoutCommandTest >> testInstanceCreation [

	| cmd |
	cmd := ManuscriptLogoutCommand token: 'pljl6316cjgv5h3cnmntbck295gf47'.
	self assert: cmd printString equals: '{"cmd": "logoff","token": "pljl6316cjgv5h3cnmntbck295gf47"}'
]

{ #category : #tests }
ManuscriptLogoutCommandTest >> testInstanceCreationEmpty [

	| cmd |
	cmd := ManuscriptLogoutCommand new.
	self assert: cmd printString equals: '{"cmd": "logoff","token": ""}'
]

{ #category : #tests }
ManuscriptLogoutCommandTest >> testRequiresSession [

	self assert: command requiresSession 
]
