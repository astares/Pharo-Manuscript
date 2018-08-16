"
List projects
"
Class {
	#name : #ManuscriptListProjectsCommandTest,
	#superclass : #TestCase,
	#instVars : [
		'command'
	],
	#category : #'Manuscript-Tests-Core-Commands'
}

{ #category : #tests }
ManuscriptListProjectsCommandTest >> testInstanceCreation [

	| cmd |
	cmd := ManuscriptListProjectsCommand token: 'pljl6316cjgv5h3cnmntbck295gf47'.
	self assert: cmd printString equals: '{"cmd": "listProjects","token": "pljl6316cjgv5h3cnmntbck295gf47"}'
]
