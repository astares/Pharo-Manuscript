"
Create a new case
"
Class {
	#name : #ManuscriptCreateNewCaseCommand,
	#superclass : #ManuscriptTokenCommand,
	#instVars : [
		'caseToCreate'
	],
	#category : #'Manuscript-Core-Commands'
}

{ #category : #'instance creation' }
ManuscriptCreateNewCaseCommand class >> token: aToken on: caseToCreate [

	^(self token: aToken)
		caseToCreate: caseToCreate;
		yourself
]

{ #category : #conversion }
ManuscriptCreateNewCaseCommand >> asJSONString [
	| params |
	params := OrderedCollection new.
	params 
		add: self commandID;
		add: self token;
		add: caseToCreate title;
		add: caseToCreate content;
		add: caseToCreate category name;
		add: caseToCreate project name;
		add: caseToCreate area name;
		add: caseToCreate milestone name;
		add: caseToCreate status name;		
		add: caseToCreate assignee name;
		add: caseToCreate priority name.		
					
	^'{"cmd": "<1s>",
	 	"token": "<2s>",
		"sTitle": "<3s>",
  		"sEvent": "<4s>",
	  	"sCategory": "<5s>",	
		"sProject": "<6s>",	
		"sArea": "<7s>",	
		"sMilestone": "<8s>",		
		"sStatus": "<9s>",	
		"sPersonAssignedTo": "<10s>",			
		"sPriority": "<11s>"}' expandMacrosWithArguments: params asArray
]

{ #category : #accessing }
ManuscriptCreateNewCaseCommand >> caseToCreate [
	^ caseToCreate
]

{ #category : #accessing }
ManuscriptCreateNewCaseCommand >> caseToCreate: anObject [
	caseToCreate := anObject
]

{ #category : #defaults }
ManuscriptCreateNewCaseCommand >> commandID [

	^'new'
]
