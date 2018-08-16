Class {
	#name : #ManuscriptCreateNewCaseCommand,
	#superclass : #ManuscriptTokenCommand,
	#instVars : [
		'caseToCreate'
	],
	#category : #'Manuscript-Core-Commands'
}

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
		add: caseToCreate project title;
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
		"sPersonAssignedTo": "<9s>",			
		"sPriority": "<10s>"' expandMacrosWithArguments: params asArray
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
