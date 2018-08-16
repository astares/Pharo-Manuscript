"
Open a case for a method
"
Class {
	#name : #ManuscriptOpenCaseForMethod,
	#superclass : #ClyBrowserCommand,
	#traits : 'ManuscriptCalypsoCommandTrait',
	#classTraits : 'ManuscriptCalypsoCommandTrait classTrait',
	#instVars : [
		'methodConcerned'
	],
	#category : #'Manuscript-Tools-Calypso-Commands'
}

{ #category : #testing }
ManuscriptOpenCaseForMethod class >> canBeExecutedInContext: aBrowserContext [

	(super canBeExecutedInContext: aBrowserContext) ifFalse: [ ^false ].	
	^aBrowserContext isMethodSelected
]

{ #category : #activation }
ManuscriptOpenCaseForMethod class >> fullBrowserMenuActivation [
	<classAnnotation>
	
	^CmdContextMenuActivation byRootGroupItemOrder: self itemOrder for: ClyMethodContextOfFullBrowser 
]

{ #category : #execution }
ManuscriptOpenCaseForMethod >> execute [
	| client |
	client := [ ManuscriptClient getWorkingClientByAskingUser ] on: ManuscriptUserCancelledLogin do: [ 
		UIManager default inform: 'Log-in cancelled.'.
		^ self ].
	ManuscriptCaseCreationPresenter openForClient: client withTemplate: 
			('The following issue has been found in {1} method:

The following code snippet(s) allows one to reproduce the issue:
' format: {methodConcerned printString})
]

{ #category : #execution }
ManuscriptOpenCaseForMethod >> prepareFullExecutionInContext: aBrowserContext [

	super prepareFullExecutionInContext: aBrowserContext.	
	methodConcerned := aBrowserContext lastSelectedMethod.
]
