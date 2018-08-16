"
A trait to be reused by Manuscript commands
"
Trait {
	#name : #ManuscriptCalypsoCommandTrait,
	#category : #'Manuscript-Tools-Calypso-Traits'
}

{ #category : #defaults }
ManuscriptCalypsoCommandTrait classSide >> defaultMenuIcon [

	^ManuscriptIconCache manuscriptIcon 
]

{ #category : #defaults }
ManuscriptCalypsoCommandTrait classSide >> defaultMenuItemName [
	^ 'Open case on Manuscript'
]

{ #category : #defaults }
ManuscriptCalypsoCommandTrait classSide >> itemOrder [
	^ 21
]
