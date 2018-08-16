"
Open a case for a class
"
Class {
	#name : #ManuscriptOpenCaseForClass,
	#superclass : #ClyBrowserCommand,
	#traits : 'ManuscriptCalypsoCommandTrait',
	#classTraits : 'ManuscriptCalypsoCommandTrait classTrait',
	#instVars : [
		'classConcerned'
	],
	#category : #'Manuscript-Tools-Calypso-Commands'
}

{ #category : #testing }
ManuscriptOpenCaseForClass class >> canBeExecutedInContext: aBrowserContext [
	(super canBeExecutedInContext: aBrowserContext) ifFalse: [ ^false ].
	
	^aBrowserContext isClassSelected 
]

{ #category : #activation }
ManuscriptOpenCaseForClass class >> fullBrowserMenuActivation [
	<classAnnotation>
	
	^CmdContextMenuActivation byRootGroupItemOrder: self itemOrder for: ClyClassContextOfFullBrowser 
]

{ #category : #execution }
ManuscriptOpenCaseForClass >> defaultMenuIcon [

	^ManuscriptIconCache manuscriptIcon 
]

{ #category : #execution }
ManuscriptOpenCaseForClass >> execute [
	| client |
	client := [ ManuscriptClient getWorkingClientByAskingUser ] on: ManuscriptUserCancelledLogin do: [ 
		UIManager default inform: 'Log-in cancelled.'.
		^ self ].
	ManuscriptCaseCreationPresenter openForClient: client withTemplate: 
			('The following issue has been found in {1} class:

The following code snippet(s) allows one to reproduce the issue:
' format: {classConcerned name})
]

{ #category : #execution }
ManuscriptOpenCaseForClass >> prepareFullExecutionInContext: aBrowserContext [

	super prepareFullExecutionInContext: aBrowserContext.	
	classConcerned := aBrowserContext lastSelectedClass.
]
