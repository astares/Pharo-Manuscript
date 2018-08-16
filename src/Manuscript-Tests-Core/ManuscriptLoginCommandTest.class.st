"
Unit tests for ManuscriptLoginCommand
"
Class {
	#name : #ManuscriptLoginCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'Manuscript-Tests-Core-Commands'
}

{ #category : #running }
ManuscriptLoginCommandTest >> setUp [

	super setUp.
	command := ManuscriptLoginCommand loginUser: 'abc@def.com' password: 'pass'.

]

{ #category : #tests }
ManuscriptLoginCommandTest >> testInstanceCreation [

	| cmd |
	cmd := ManuscriptLoginCommand loginUser: 'abc@def.com' password: 'pass'.
	self assert: cmd printString equals: '{"cmd": "logon","email": "abc@def.com","password": "pass"}'
]

{ #category : #tests }
ManuscriptLoginCommandTest >> testRequiresSession [

	self deny: command requiresSession 
]
